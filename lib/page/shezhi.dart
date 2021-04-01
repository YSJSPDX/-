import 'package:flutter/material.dart';

class SheZhiPage extends StatefulWidget {
  SheZhiPage({Key key}) : super(key: key);

  @override
  _SheZhiPageState createState() => _SheZhiPageState();
}

class _SheZhiPageState extends State<SheZhiPage> {
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
            _getUserHeader(),
            _divider(),
            _getMyOrders(),
            _divider(),
            _getMyproperty(),
            _divider(),
            _getCollection(),
            SizedBox(
              height: 50,
            ),
             _divider(),
            _getSide(),
            _divider(),
          ],
        ),
      ),
    );
  }

  Widget _getUserHeader() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(bottom: 20, left: 20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 26.0,
            backgroundImage: AssetImage("assets/image/head.gif"),
          ),
        ],
      ),
    );
  }

  Widget _getMyOrders() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(bottom: 20, left: 20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            child: Text("昵称"),
          )
        ],
      ),
    );
  }

  Widget _getMyproperty() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(bottom: 20, left: 20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            child: Text("隐私协议"),
          )
        ],
      ),
    );
  }

  Widget _getCollection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(bottom: 20, left: 20),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            child: Text("版本更新"),
          )
        ],
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
          Container(
            child: Text("退出登录"),
          )
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
