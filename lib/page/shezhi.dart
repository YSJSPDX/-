import 'package:flutter/material.dart';
import 'user_page1.dart';

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
            _divider(),
            SizedBox(
              height: 50,
            ),
            _getSide(),
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
          ),
          Spacer(),
          Container(
            child: Text("198****9707   "),
          ),
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
          ),
          Spacer(),
          Container(
            child: Text("~      "),
          ),
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
          ),
          Spacer(),
          Container(
            child: Text("当前为最新版本v1.1.2   "),
          ),
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
          RaisedButton(
          child:Text('退出登录'),
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
