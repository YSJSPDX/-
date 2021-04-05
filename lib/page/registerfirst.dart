import 'package:flutter/material.dart';
import 'registersecond.dart';

class RegisterFistPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _isObscure = true;
  Color _eyeColor;
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
                buildNameTextField1(),
                SizedBox(height: 20.0),
                buildNameTextField2(),
                SizedBox(height: 20.0),
                buildNameTextField3(),
                SizedBox(height: 20.0),
                buildNameTextField4(),
                SizedBox(height: 20.0),
                buildNameTextField5(),
                SizedBox(height: 20.0),
                buildRaisedButton(context),
              ],
            )));
  }

  RaisedButton buildRaisedButton(BuildContext context) {
    return RaisedButton(
              child: Text('下一步'),
              onPressed:(){
                Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return new RegisterSecondPage();
                            }));
                // Navigator.of(context).pushReplacementNamed('/registersecond');
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
        '注册—基础信息',
        style: TextStyle(fontSize: 42.0),
      ),
    );
  }

  TextFormField buildNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '姓名',
      ),
       validator: (String value) {
        if (value.isEmpty) {
          return '请输入姓名';
        }
      },
      onSaved: (String value) => _email = value,
    );
  }
  TextFormField buildNameTextField1() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '身份证',
      ),
       validator: (String value) {
        if (value.isEmpty) {
          return '请输入身份证';
        }
      },
      onSaved: (String value) => _email = value,
    );
  }
  TextFormField buildNameTextField2() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '手机号',
      ),
       validator: (String value) {
        if (value.isEmpty) {
          return '请输入手机号';
        }
      },
      onSaved: (String value) => _email = value,
    );
  }
  TextFormField buildNameTextField3() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '密码',
      ),
       validator: (String value) {
        if (value.isEmpty) {
          return '请输入密码';
        }
      },
      onSaved: (String value) => _email = value,
    );
  }
  TextFormField buildNameTextField4() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '确认密码',
      ),
       validator: (String value) {
        if (value.isEmpty) {
          return '请输入密码';
        }
      },
      onSaved: (String value) => _email = value,
    );
  }
  TextFormField buildNameTextField5() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '输入邮箱进行验证',
      ),
       validator: (String value) {
        if (value.isEmpty) {
          return '请输入邮箱';
        }
      },
      onSaved: (String value) => _email = value,
    );
  }

}