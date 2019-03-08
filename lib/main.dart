import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title:"Hello World！",
        home:new RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new RandomWordsStates();
}

class RandomWordsStates extends State<RandomWords>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();

    return new Scaffold(
      appBar: new AppBar(title:new Text("测试")),
      body:_buildList()
    );
  }

  final _list = <String>[];
  final _biggerFont = const TextStyle(fontSize: 20);

  Widget _buildList(){

  }

}