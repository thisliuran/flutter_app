import 'package:flutter/material.dart';
import 'package:flutter_app/com/zzdx/znzw/view/layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"智能组网",
      theme: new ThemeData(primaryColor: Colors.lightBlue),

      home:new Layout(),

    );
  }
}