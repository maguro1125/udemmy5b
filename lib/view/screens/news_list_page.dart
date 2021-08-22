import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemmy5b/data/search_type.dart';
import 'package:udemmy5b/models/model/news_model.dart';
import 'package:udemmy5b/view/screens/components/article_tile.dart';
import 'package:udemmy5b/view/screens/components/category.chip.dart';
import 'package:udemmy5b/view/screens/components/search_bar.dart';
import 'package:udemmy5b/data/category_info.dart';
import 'package:udemmy5b/view/screens/news_web_page.dart';
import 'package:udemmy5b/viewmodels/news_list_viewmodel.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);//アプリ開いた時にデータの取得
    //final viewModel = context.read<NewsListViewModel>();

    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getNews(
          searchType: SearchType.CATEGORY, category: categories[0]));
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            tooltip: "更新",
            onPressed: () => onRefresh(context)),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SearchBar(
                onSearch: (keyword) => getKeywordNews(context, keyword),
              ),
              //カテゴリー記事表示
              CategoryChips(
                onCategorySelected: (category) =>
                    getCategories(context, category),
              ),
              Expanded(
                child: Consumer<NewsListViewModel>(
                    builder: (context, model, child) {
                  return model.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: model.articles.length,
                          itemBuilder: (context, int position) => ArticleTile(
                                article: model.articles[position],
                                onArticleClicked: (article) =>
                                    _openArticleWebPage(article, context),
                              ));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //記事更新処理
  Future<void> onRefresh(BuildContext context) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
        searchType: viewModel.searchType,
        keyWord: viewModel.keyword,
        category: viewModel.category);
    print("ok!");
  }

  //キーワード取得処理
  Future<void> getKeywordNews(BuildContext context, keyword) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: SearchType.KEYWORD,
      keyWord: keyword,
      category: categories[0],
    );
  }

  //カテゴリー記事検索処理
  Future<void> getCategories(BuildContext context, Category category) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: SearchType.CATEGORY,
      category: category,
    );
  }

  _openArticleWebPage(Article article, BuildContext context) {
    print("_openArticleWebPage: ${article.url}");
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NewsWebPageScreen(article: article,)
    ));
  }
}
