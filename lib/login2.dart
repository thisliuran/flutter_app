
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import  'dart:convert';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  String _phoneErrorText = null;

  Future _forSubmitted() async {
    var _form = _formKey.currentState;

    if (!_form.validate()) return;
    Dio dio = new Dio();
    Response response;
    response=await dio.get("http://www.httpbin.org/get",
        queryParameters: {"phonenumber":phoneController.text,"password":passController.text});
    List<Object> map = json.decode(response.data.toString());

    print(map[0]);
    setState(() {
      _phoneErrorText = map[0] as String;
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter data',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('登录'),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _forSubmitted,
          child: new Text('提交'),
        ),
        body: new Container(
          padding: const EdgeInsets.all(16.0),
          child: new Form(
            key: _formKey,
            autovalidate: true,
            child: new Column(
              children: <Widget>[
                new TextFormField(

                  autofocus: true,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: new InputDecoration(
                      labelText: '手机号',
                      icon: Icon(Icons.phone),
                      errorText: _phoneErrorText),
                  validator: (v) {
                    return RegExp(r"\d{11}").hasMatch(v) ? null : "手机号不正确";
                  },

                ),
                new TextFormField(
                    controller: passController,
                    decoration: new InputDecoration(
                        labelText: 'Password', icon: Icon(Icons.lock)),
                    obscureText: true,
                    validator: (val) {
                      return val.length < 4 ? "密码长度错误" : null;
                    }),

                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    new Expanded(
                        flex: 1,
                        child: new RaisedButton(
                            child: Text("登录"),
                            color: Colors.lightBlue,
                            onPressed: _forSubmitted))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
