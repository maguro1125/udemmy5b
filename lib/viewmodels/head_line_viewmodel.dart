
import 'package:flutter/material.dart';
import 'package:udemmy5b/data/search_type.dart';
import 'package:udemmy5b/models/model/news_model.dart';
import 'package:udemmy5b/models/repository/news_repository.dart';


//モデルからの外注処理
class HeadLineViewModel extends ChangeNotifier{

  final NewsRepository _repository;

  //外から処理を注入
  HeadLineViewModel({repository}): _repository = repository;


  SearchType _searchType = SearchType.CATEGORY;
  SearchType get searchType => _searchType;


  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Article> _articles = [];
  List<Article> get articles => _articles;

  @override
  void dispose() {
    _repository.dispose();
    super.dispose();
  }

  Future<void>getHeadLines({@required SearchType searchType}) async{
    _searchType = searchType;
    _isLoading = true;
    notifyListeners();

    _articles = await _repository.getNews(searchType: SearchType.HEAD_LINE);
    print("searchType: $searchType / article ${_articles[0].title}");


    _isLoading = false;
    notifyListeners();



  }

}