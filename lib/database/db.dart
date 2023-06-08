import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:word_book/database/migrations.dart' as migrations;

/// Database storing words list.
class Db {
  static Db? _instance;
  late final Database db;

  Db._();

  Future<void> _init() async {
    var databasesPath = '${await getDatabasesPath()}/words.db';
    db = await openDatabase(
      databasesPath,
      version: 1,
      onCreate: (Database db, int version) async {
        if (kDebugMode) {
          print('Word Book - Creating DB - ${migrations.createTable}');
        }
        await db.execute(migrations.createTable);
      },
    );
  }

  Future<Map<String, String>> loadAllWords() async {
    final list =
        await db.query('words_table', columns: ['word', 'translation']);
    final words = <String, String>{};
    for (final entry in list) {
      words[entry['word'].toString()] = entry['translation'].toString();
    }
    return words;
  }

  Future<void> insertWord(String word, String translation) async {
    await db.insert('words_table', {'word': word, 'translation': translation});
  }

  static Future<Db> getInstance() async {
    _instance ??= Db._();
    await _instance!._init();
    return _instance!;
  }
}
