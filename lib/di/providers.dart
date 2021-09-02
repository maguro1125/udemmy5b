import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:udemmy5b/models/db/dao.dart';
import 'package:udemmy5b/models/db/database.dart';
import 'package:udemmy5b/models/networking/api_service.dart';
import 'package:udemmy5b/models/repository/news_repository.dart';
import 'package:udemmy5b/viewmodels/head_line_viewmodel.dart';
import 'package:udemmy5b/viewmodels/news_list_viewmodel.dart';

List<SingleChildWidget>globalProviders = [
  ...independentModel,
  ...dependentModel,
  ...viewModel,
];

//依存性が低い順
List<SingleChildWidget> independentModel = [
  Provider<ApiService>(
    create: (_) => ApiService.create(),
    dispose: (_, apiService) => apiService.dispose(),
  ),
  Provider<MyDatabase>(
    create: (_) => MyDatabase(),
    dispose: (_, db) => db.close(),
  )
];

//ProxyProvider<依存される側,依存する側>
List<SingleChildWidget> dependentModel = [
  ProxyProvider<MyDatabase, NewsDao>(
    update: (_, db, dao) => NewsDao(db),
  ),
  ProxyProvider2<NewsDao, ApiService, NewsRepository>(
    update: (_, dao, apiService, repository) =>
        NewsRepository(dao: dao, apiService: apiService),
  )
];




List<SingleChildWidget> viewModel = [
  ChangeNotifierProvider<HeadLineViewModel>(
      create: (context) => HeadLineViewModel(
        repository: Provider.of<NewsRepository>(context, listen: false),
      ), ),
  ChangeNotifierProvider<NewsListViewModel>(
    create: (context) => NewsListViewModel(
      repository: Provider.of<NewsRepository>(context, listen: false),
),
  )
];
