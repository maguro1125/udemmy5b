import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:udemmy5b/models/db/dao.dart';

part 'database.g.dart';

//Tableを継承してクラス名は複数形
class ArticleRecords extends Table{
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get url => text()();
  TextColumn get urlToImage => text()();
  TextColumn get publishData => text()();
  TextColumn get content => text()();


}

@UseMoor(tables: [ArticleRecords], daos: [NewsDao])
class MyDatabase extends _$MyDatabase{

  MyDatabase() : super(_openConnection());


  @override
  int get schemaVersion  => 1;

}

  LazyDatabase _openConnection() {
    // the LazyDatabase util lets us find the right location for the file async.
    return LazyDatabase(() async {
      // put the database file, called db.sqlite here, into the documents folder
      // for your app.
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'news.db.'));
      return VmDatabase(file);
    });
  }
