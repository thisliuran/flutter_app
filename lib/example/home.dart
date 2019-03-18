
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/example/net.dart';
import 'package:flutter_app/example/order.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Hello World！",
      theme: new ThemeData(primaryColor: Colors.lightBlue),

      home:new HomePage(),

    );
  }
}


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Page();
  }
}

class Page extends State<HomePage> {
  String dataStr = "";
  var _items = [];

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    Map<String, String> map = new Map();
    map["v"] = "1.0";
    map["month"] = "7";
    map["day"] = "25";
    map["key"] = "bd6e35a2691ae5bb8425c8631e475c2a";
   // HttpController.post("http://api.juheapi.com/japi/toh", (data) {
      HttpController.get("http://172.20.147.17:10005/api/all", (data) {
      if (data != null) {
        print(data);
        final body = json.decode(data.toString());
        print(body);
//final feeds = body["result"];
       var items = [];
        body.forEach((item) {
          items.add(Order(item["order_id"],item["creater_id"],item["describe"]));
        });
        setState(() {
          dataStr = data.toString();
          _items = items;
        });
      }
    }, params: map,errorCallback: (){

      });
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context),
      body:Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 9,
            child: new ListView.builder(itemCount: _items.length, itemBuilder: itemView),
          ),
          Expanded(
            flex: 1,
            child: FloatingActionButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return new Scaffold(
                  appBar: AppBar(title: Text("1"),),
                  body:FloatingActionButton(
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context){
                            return HomePage();
                          }), (route) => route == null);

                    },
                  )
                );
              }));
            }),
          )
        ],
      )

    );
  }

  Widget itemView(BuildContext context, int index) {
    Order model = this._items[index];
    //设置分割线
    if (index.isOdd) return new Divider(height: 2.0);
    return new Container(
        color: Color.fromARGB(0x22, 0x49, 0xa9, 0x8d),
        child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Text('${model.order_id}',
                            style: new TextStyle(fontSize: 15.0)),

                      ],
                    ),
                    new Center(
                      heightFactor: 6.0,
                      child: new Text("${model.creater_id}",
                          style: new TextStyle(fontSize: 17.0)),
                    )
                  ],
                ))));
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('历史今日'));
  }
}

//class Model {
//  String _id;
//  String title;
//  String pic;
//  int year;
//  int month;
//  int day;
//  String des;
//  String lunar;
//
//  Model(this._id, this.title, this.pic, this.year, this.month, this.day,
//      this.des, this.lunar);
//}
