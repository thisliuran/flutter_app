import 'package:flutter/material.dart';
import 'package:flutter_app/old/znzw/index.dart';
import 'package:flutter_app/old/znzw/login2.dart';
import 'package:flutter_app/old/znzw/pic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title:"Hello World！",
        theme: new ThemeData(primaryColor: Colors.lightBlue),

        home:new LoginPage(),

    );
  }
}

