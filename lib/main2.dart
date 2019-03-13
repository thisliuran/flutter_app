import 'package:flutter/material.dart';
import 'package:flutter_app/form_demo.dart';
import 'package:flutter_app/login2.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: NavigatorDemo(),
      initialRoute: '/form',
      routes: {
        '/':(context)=>LoginPage(),
        '/form':(context)=>FormDemo(),
      },
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.red),
    );
  }
}
 