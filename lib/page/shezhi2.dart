import 'package:flutter/material.dart';
import 'user_page1.dart';

class SheZhi1Page extends StatefulWidget {
  SheZhi1Page({Key key}) : super(key: key);

  @override
  _SheZhiPageState createState() => _SheZhiPageState();
}

class _SheZhiPageState extends State<SheZhi1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            _divider(),

            SizedBox(
              height: 50,
            ),
            _getSide(),
            _getSide2(),
          ],
        ),
      ),
    );
  }

  Widget _getSide() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(bottom: 20, left: 20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
          child:Text('登录'),
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return new UserPage1();
                }));
          },
          color:Theme.of(context).accentColor,
          textTheme:ButtonTextTheme.primary
        ),
        ],
      ),
    );
  }
  Widget _getSide2() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(bottom: 20, left: 20),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
          child:Text('注册'),
          onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return new UserPage1();
                }));
          },
          color:Theme.of(context).accentColor,
          textTheme:ButtonTextTheme.primary
        ),
        ],
      ),
    );
  }
}

Widget _divider() {
  return Divider(
    height: 1.0,
    indent: 0.0,
    color: Colors.grey,
  );
}
