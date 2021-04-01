import 'package:flutter/material.dart';
import 'package:jd_app/page/user_page1.dart';

import 'index_page.dart';


class RegisterThirdPage extends StatelessWidget {
  const RegisterThirdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar:AppBar(
           title:Text('第三步-完成注册')
         ),
        body: Center(
          child: Column(
            children:<Widget> [
              SizedBox(height:40),
              Text("输入密码 完成注册"),
              SizedBox(height:40),
              RaisedButton(
                child: Text('确定'),
                onPressed:(){
                  Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return new UserPage1();
                              }));
                },
                 )
            ],
          ),
        )
       );
  }
}