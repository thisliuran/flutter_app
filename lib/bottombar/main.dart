import 'package:flutter/material.dart';
import 'package:flutter_app/bottombar/index2.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"备件管理",
      theme: new ThemeData(primaryColor: Colors.lightBlue),

      home:new Index(),

    );
  }
}

