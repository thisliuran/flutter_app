import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/example/order.dart';
import 'dart:convert';

class Index extends StatefulWidget {
  // final items ;
  final String title;
  Index({Key key, this.title = "ha"}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new IndexState();
}

class IndexState extends State<Index>  {
  List<Order> _items = [];
  Order select;

  @override
  void initState() {



//    print("--------------离开 INIT ---------------");

  }

  @override
  Widget build(BuildContext context)    {
  int i = 0;
  if(i==0){
    print("--------------进入 INIT ---------------");
    List<Order> items = [];
    Dio dio = new Dio();
   // Response response = await  dio.get("http://127.0.0.1:10005/api/all");
//     HttpController.get(, (data) {
//      if (data != null) {
//        final body = json.decode(data.toString());
//
//        print(body);
//        body.forEach((f) {
//          Order o = new Order(f["order_id"], f["creater_id"], f["describe"]);
//
//          //print(f);
//          items.add(o);
//        });
//
//        print("build:" + items.length.toString());
//      }
//
//      setState(() {
//        _items = items;
//      });

    print("--------------离开 INIT ---------------");

    List<Widget> tiles = _items.map((order) {
      return new ListTile(
          title: Text(order.order_id), trailing: Icon(Icons.star_border));
    }).toList();
//  tiles.add(new ListTile(
//      title: Text(
//        "新增工单",
//        textAlign: TextAlign.center,
//        style: TextStyle(fontSize: 24),
//      ),
//    ));

    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,

      children: <Widget>[
        Expanded(
          flex: 9,
          child: ListView(
            padding: EdgeInsets.all(20.0),
            children: tiles,

          ),
        ),
        Expanded(

          flex: 1,


            child: FloatingActionButton(
            mini: true,
              child: Icon(Icons.add,),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context){
                    return new Scaffold(
                      appBar: AppBar(
                        title: Text("新增工单"),
                      ),
                      body: new Center(child:Text("11111")),
                      floatingActionButton: FloatingActionButton(
                          child: Icon(Icons.check),
                          onPressed: null),
                    );
                  })

                  );
                }

          ),
        )
      ],
    );
  }


  }
}

/*
ListView.builder(
        padding: EdgeInsets.all(20.0),

        itemCount: _items.length,
        itemBuilder: ( context,  index) {
          return new ListTile(
            trailing: Icon(Icons.ac_unit),
            title: new Text("${_items[index].order_id}"),
          );
        });


 */
