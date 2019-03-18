import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/old/znzw/login.dart';
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
        appBar: new AppBar(title:new Text("测试"),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.save), onPressed: _pushSaved),
            new IconButton(icon: new Icon(Icons.local_gas_station), onPressed: (){login();}),
//            new IconButton(icon: new Icon(Icons.add_circle), onPressed: (){_pushPic2(222222222);}),
          ],
        
        ),
     
        body:_buildList(),
    );
  }

  final _list = <String>[];
  final _savedList = <String>[];
  final _bigger = TextStyle(fontSize: 28);

  Widget _buildList(){
    return new ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemBuilder: (context,i){
          if(i%2 == 1)
            return new Divider();
          final index = i~/2;
          if(index>= _list.length)
            _list.addAll(generateWordPairs().take(10).map((pair)=>pair.asCamelCase));
          final _saved = _savedList.contains(_list[index]);
          return new ListTile(
              title: new Text(_list[index]+i.toString(),
                style: _bigger,),
              trailing: new Icon(_saved?Icons.favorite:Icons.favorite_border,
                color:_saved ? Colors.red : Colors.black26 ,
              ),
              onTap: (){
                setState(() {
                  if(_saved)
                    _savedList.remove(_list[index]);
                  else
                    _savedList.add(_list[index]);
                });
              },
            onLongPress:(){ _lookat(_list[index]);
            },
          );
        });
  }


  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context){
        final tiles = _savedList.map( (pair) => new ListTile(title: new Text(pair,style: _bigger,),));
        final  divided = ListTile.divideTiles( context: context,tiles: tiles).toList();
        return new Scaffold(
          appBar: new AppBar(
            title: new Text('我的收藏'),
          ),
          body: new ListView(children: divided),
        );
      })
    );
  }

  void _lookat(String words) {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context){
        return new Scaffold(
          appBar: new AppBar(title: new Text(words),),
          body:new Center(child: new Text(words,style: _bigger,),)
        );
      })
    );
  }

  void login() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new LoginWidget()));
  }





}