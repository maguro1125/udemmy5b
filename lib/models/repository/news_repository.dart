import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemmy5b/data/category_info.dart';
import 'package:udemmy5b/data/search_type.dart';
import 'package:udemmy5b/main.dart';
import 'package:udemmy5b/models/db/dao.dart';
import 'package:udemmy5b/models/db/database.dart';
import 'package:udemmy5b/models/model/news_model.dart';
import 'package:udemmy5b/models/networking/api_service.dart';
import 'package:udemmy5b/utill/extentions.dart';


//viewModelからモデルへの外注処理
class NewsRepository {

  final ApiService _apiService;

  final NewsDao _dao;

//使う時はプライベート、入れる時はパブリック
// 外から処理を注入
  NewsRepository({dao, apiService})
      : _apiService = apiService,
        _dao = dao;

  Future<List<Article>> getNews({
    @required SearchType searchType, String keyWord, Category category}) async {
    List<Article> result = List<Article>();

    Response response;//APIの結果をレスポンスで取得しているから


    //ニュース所得処理のサーチパターン、エラーのチェック
    try {
      switch (searchType) {
        case SearchType.HEAD_LINE:
          print("NewsRepository.getHeadLines");
          response = await _apiService.getHeadLines();
          break;
        case SearchType.KEYWORD:
          response = await _apiService.getKeywordNews(keyword: keyWord);
          break;
        case SearchType.CATEGORY:
          response =
          await _apiService.getCategoryNews(category: category.nameEn);//カテゴリーは英語名で検索をする
          break;
      }
      if (response.isSuccessful) {
        final responseBody = response.body;
        print("responseBody: $responseBody");
        result = await insertAndReadFromDB(responseBody);
      } else {
        final errorCode = response.statusCode; //レスポンスが返ってきての失敗
        final error = response.error;
        print("response is not successful: $errorCode / $error");
      }
    } on Exception catch (error) {
      print("error: $error");
    }
    return result;
  }

  void dispose() {
    _apiService.dispose();
  }


  Future<List<Article>> insertAndReadFromDB(responseBody) async {
    final articles = News
        .fromJson(responseBody)
        .articles;//Jsonで記事を変換

    //Webから取得した記事リスト（Dartのモデルクラス：Article）をDBのテーブルクラス（Articles）に変換してDB登録・DBから取得
    final articleRecords = await _dao.insertAndReadNewsFromDB(
        articles.toArticleRecords(articles)
    );

    //DBから取得したデータをモデルクラスに再変換して返す
    return articleRecords.toArticles(articleRecords);
  }

}