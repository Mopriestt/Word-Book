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
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                word,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(translation)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final words = context.watch<WordListService>().words.entries.toList();
    return ListView.builder(
      itemCount: words.length,
      itemBuilder: (context, index) {
        return _buildItem(words[index].key, words[index].value);
      },
      prototypeItem: _buildItem('word', 'translation'),
    );
  }
}
