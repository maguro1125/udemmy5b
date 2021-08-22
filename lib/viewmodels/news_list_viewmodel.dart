import 'package:flutter/material.dart';
import 'package:udemmy5b/data/category_info.dart';
import 'package:udemmy5b/data/search_type.dart';
import 'package:udemmy5b/models/model/news_model.dart';
import 'package:udemmy5b/models/repository/news_repository.dart';

//モデルからの外注処理

class NewsListViewModel extends ChangeNotifier {

  final NewsRepository _repository;

  //外から処理を注入
  NewsListViewModel({repository}): _repository = repository;

  SearchType _searchType = SearchType.CATEGORY;
  SearchType get searchType => _searchType;

  Category _category = categories[0];
  Category get category => _category;

  String _keyword = "";
  String get keyword => _keyword;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Article> _articles = [];
  List<Article> get articles => _articles;

  //ニュースを取得する
 Future<void> getNews({
    @required SearchType searchType, String keyWord, Category category}) async{
    _searchType = searchType;
    _keyword = keyWord;
    _category = category;

    _isLoading = true;
    notifyListeners(); //データの取得処理を外注している(データの変更処理をする通知)


    _articles = await _repository.getNews(
      searchType: _searchType, keyWord: _keyword, category: _category,);

    // print("searchType: $searchType / keyword: $keyWord/ category: $category/ articles: ${_articles[0].title}");


    _isLoading = false;
    notifyListeners(); //データの取得がおわった(変更処理が完了した通知)
  }

  @override
  void dispose() {
   _repository.dispose();
    super.dispose();
  }
}