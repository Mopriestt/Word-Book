import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_book/database/db.dart';
import 'package:word_book/service/word_list_service.dart';

import 'home/home.dart';
import 'home/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MaterialApp(home: SplashScreen()));
  runApp(
    MultiProvider(
      providers: await _dependencies().toList(),
      child: const MaterialApp(home: Home()),
    ),
  );
}

Stream<Provider> _dependencies() async* {
  final db = await Db.getInstance();
  yield Provider.value(value: db);
  yield Provider<WordListService>.value(value: await WordListService.getInstance(db));
}
