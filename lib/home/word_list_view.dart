import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/word_list_service.dart';

class WordListView extends StatefulWidget {
  const WordListView({super.key});

  @override
  State<WordListView> createState() => _WordsListViewState();
}

class _WordsListViewState extends State<WordListView> {
  Widget _buildItem(String word, String translation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          word,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(translation)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final words = context.watch<WordListService>().words.entries.toList();
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        indent: 48,
        endIndent: 48,
        color: Colors.black,
      ),
      itemCount: words.length,
      itemBuilder: (context, index) {
        return _buildItem(words[index].key, words[index].value);
      },
    );
  }
}
