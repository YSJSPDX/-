import 'package:flutter/material.dart';
import 'package:jd_app/page/login.dart';
import 'registerthird.dart';
import 'user_page1.dart';

class RegisterSecondPage extends StatelessWidget {
  const RegisterSecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              children: <Widget>[
                SizedBox(
                  height: kToolbarHeight,
                ),
                buildTitle(),
                buildTitleLine(),
                SizedBox(height: 70.0),
                buildNameTextField(),
                SizedBox(height: 20.0),
                buildRaisedButton(context),
              ],
            )));
  }
  TextFormField buildNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '验证码',
      ),
       validator: (String value) {
        if (value.isEmpty) {
          return '请输入验证码';
        }
      },
    );
  }
  Padding buildTitleLine() {
    return Padding(
      padding: EdgeInsets.only(left: 12.0, top: 4.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          color: Colors.black,
          width: 80.0,
          height: 2.0,
        ),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '注册—验证码',
        style: TextStyle(fontSize: 42.0),
      ),
    );
  }
  RaisedButton buildRaisedButton(BuildContext context) {
    return RaisedButton(
              child: Text('完成注册'),
              onPressed:(){
                 Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return new LoginPage();
                              }));
                // Navigator.of(context).pushReplacementNamed('/registersecond');
              },
               );
  }
}