

import 'package:udemmy5b/models/db/database.dart';
import 'package:udemmy5b/models/model/news_model.dart';

//拡張メソッド データベースに保存して、モデルクラスに変換して渡す作業
//Dartのモデルクラス => DBのテーブルクラス
extension ConvertToArticleRecord on List<Article> {
  List<ArticleRecord> toArticleRecords(List<Article> articles){
    var articleRecords = List<ArticleRecord>();
    articles.forEach((article){
      articleRecords.add(
          ArticleRecord(
              title: article.title ?? "",
              description: article.description ?? "",
              url: article.url,
              urlToImage: article.urlToImage ?? "",
              publishData: article.publishData ?? "",
              content: article.content ?? ""
          )
      );
    });
    return articleRecords;
  }
}
//DBテーブルクラス=> Dartのモデルクラス
extension ConvetToArticle on List<ArticleRecord>{
  List<Article> toArticles(List<ArticleRecord> articleRecords){
    var articles = List<Article>();
    articleRecords.forEach((articleRecord){
      articles.add(
          Article(title: articleRecord.title ?? "",
              description: articleRecord.description ?? "",
              url: articleRecord.url,
              urlToImage: articleRecord.urlToImage ?? "",
              publishData: articleRecord.publishData ?? "",
              content: articleRecord.content ?? ""
          )
      );
    });
    return articles;
  }
}