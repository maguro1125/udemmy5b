import 'package:moor/moor.dart';
import 'package:udemmy5b/models/db/database.dart';

part 'dao.g.dart';

//DBのクエリメソッドが多量になることを防ぐため
@UseDao(tables: [ArticleRecords])
class NewsDao extends DatabaseAccessor<MyDatabase> with _$NewsDaoMixin {
  NewsDao(MyDatabase db) : super(db);


  //アプリを開いた時に中身をクリアしておく
  Future clearDB() => delete(articleRecords).go();

  Future insertDB(List<ArticleRecord> articles) async {
    await batch((batch) {
      batch.insertAll(articleRecords, articles);//2行以上入れたい場合
    });
  }

  Future <List<ArticleRecord>> get articlesFromDB =>
      select(articleRecords).get(); //READする

  Future<List<ArticleRecord>> insertAndReadNewsFromDB(
      List<ArticleRecord> articles) => transaction(() async{
        await clearDB();
        await insertDB(articles);
        return await articlesFromDB; //3つのクエリメソッドを一括処理するメソッド
  });


}