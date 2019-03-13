import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool _autovalidate=false;
  void submintRegisterForm() {


    if(registerFormKey.currentState.validate()){
      registerFormKey.currentState.save();
      debugPrint('username $username');
      debugPrint('password $password');
      Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Registering...'),
          )
      );
    }else{
      setState(() {
        _autovalidate=true;
      });
    }

  }

  String validateUsername(value) {
    if (value.isEmpty) {
      return "Username  os required.";
    }
    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return "Password is required.";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
              helperText: 'please input Username',
            ),
            onSaved: (value) {
              username = value;
            },
            validator: validateUsername,
            autovalidate: _autovalidate,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: 'please inputPassword',
            ),
            onSaved: (value) {
              password = value;
            },
            validator: validatePassword,
            autovalidate: _autovalidate,
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).splashColor,
              child: Text('Register', style: TextStyle(color: Colors.white)),
              elevation: 0.0,
              onPressed: submintRegisterForm,
            ),
          ),
        ],
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).splashColor,
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextFieldDemoState();
  }
}

class TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // textEditingController.text='hi';
    textEditingController.addListener(() {
      debugPrint('input ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: textEditingController,
      // onChanged: (value){
      //   debugPrint('input：$value');
      // },
      onSubmitted: (value) {
        debugPrint('submit:$value');
      },
      decoration: InputDecoration(
          icon: Icon(Icons.subject),
          labelText: 'Title',
          hintText: 'Enter the post title.',
          // border: InputBorder.none,
          // border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.green),
    );
  }
}