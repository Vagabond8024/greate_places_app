import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<void> insert(String table, Map<String, Object> data) async {
    final dbPath = await sql.getDatabasesPath();
    final sqlB = await sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXt PRIMARY KEY, title TEXT, image TEXT)');
    }, version: 1);
    await sqlB.insert(table, data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
