import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_book/home/word_list_view.dart';
import 'package:word_book/service/word_list_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AlertDialog _buildAddWordDialog() {
    final c1 = TextEditingController();
    final c2 = TextEditingController();
    return AlertDialog(
      content: IntrinsicHeight(
        child: Column(children: [
          TextField(controller: c1),
          TextField(controller: c2),
        ]),
      ),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: const Text('Quit'))
        ,
        TextButton(onPressed: () {
          Navigator.of(context).pop('${c1.text}#${c2.text}');
        }, child: const Text('Add'))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const WordListView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await showDialog(
              context: context, builder: (context) => _buildAddWordDialog()) as String?;
          if (result != null) {
            final word = result.split('#');
            context.read<WordListService>().insertWord(word[0], word[1]);
          }
        },
      ),
    );
  }
}
