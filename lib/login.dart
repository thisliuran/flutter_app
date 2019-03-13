import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginState();
  }
}

class LoginState extends State<LoginWidget> {
  _pullResponse(String str) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return new Scaffold(
        appBar: AppBar(
          title: Text("RESPONSE"),
        ),
        body: Text(str),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    TextEditingController phoneController = new TextEditingController();
    TextEditingController passController = new TextEditingController();
    GlobalKey _formKey = new GlobalKey<FormState>();

    _login() async {
      var param = ({
        'phone_number': phoneController.text,
        'password': passController.text
      });
      HttpClient httpClient = new HttpClient();
      Uri uri = new Uri.http("www.httpbin.org", "/post", param);
      HttpClientRequest request = await httpClient.postUrl(uri);
      HttpClientResponse response = await request.close();
      String responseBody = await response.transform(utf8.decoder).join();
      print(responseBody);
      httpClient.close();
      _pullResponse(responseBody);
    }

    _clear() {
      phoneController.text = "";
      passController.text = "";
    }

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("登录"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
              key: _formKey, //设置globalKey，用于后面获取FormState
              //autovalidate: true,
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  TextFormField(
                    controller: phoneController,
                    autofocus: true,
                    validator: (v) {
                      return RegExp(r"\d{11}").hasMatch(v)? null : "手机号不正确";
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "手机号：",
                      border: InputBorder.none,
                      hintText: "请输入您的手机号",
                      icon: Icon(Icons.person),
                      //suffixIcon:  Icon(Icons.person),
                    ),
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp(r"\d")),
                    ],
                  ),
                  TextFormField(
                      controller: passController,
                      decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "您的登录密码",
                          icon: Icon(Icons.lock)),
                      obscureText: true,
                      //校验密码
                      validator: (v) {
                        return RegExp(r"\d{11}").hasMatch(v)? null : "手机号不正确";
                      }),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            padding: EdgeInsets.all(15.0),
                            child: Text("登录"),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              //在这里不能通过此方式获取FormState，context不对
                              //print(Form.of(context));

                              // 通过_formKey.currentState 获取FormState后，
                              // 调用validate()方法校验用户名密码是否合法，校验
                              // 通过后再提交数据。
                              if ((_formKey.currentState as FormState)
                                  .validate()) {
                                //验证通过提交数据
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
