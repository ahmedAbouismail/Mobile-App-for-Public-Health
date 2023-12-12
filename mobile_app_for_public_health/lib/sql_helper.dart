import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  // Erstellt Tabelle User
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      age INT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'dbdrugtolerance.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  /* Erstellt einzelnen User
  * 
  */
  static Future<int> createUser(String name, int age) async {
    final db = await SQLHelper.db();

    final data = {'name': name, 'age': age};
    final id = await db.insert('users', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Listet alle Users auf
  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await SQLHelper.db();
    return db.query('users', orderBy: "id");
  }

  // Listet bestimmten User
  static Future<List<Map<String, dynamic>>> getUser(int id) async {
    final db = await SQLHelper.db();
    return db.query('users', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update User
  static Future<int> updateUser(int id, String name, int age) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name,
      'age': age,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('users', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete User
  static Future<void> deleteUser(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("users", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Der Nutzer konnte nicht gefunden werden: $err");
    }
  }
}
