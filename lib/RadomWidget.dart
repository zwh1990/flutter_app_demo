import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RadomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Padding(
      padding: EdgeInsets.all(10),
      child: new Text(wordPair.toString()),
    );
  }
}
