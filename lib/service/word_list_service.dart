import '../database/db.dart';

class WordListService {
  final Db db;
  late final Map<String, String> words;

  WordListService._(this.db);

  static Future<WordListService> getInstance(Db db) async {
    final service = WordListService._(db);
    service.words = await db.loadAllWords();
    return service;
  }

  Future<void> insertWord(String word, String translation) {
    words[word] = translation;
    return db.insertWord(word, translation);
  }
}