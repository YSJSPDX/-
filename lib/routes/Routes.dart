import 'package:flutter/material.dart';
import 'package:jd_app/page/index_page.dart';
import 'package:jd_app/page/shezhi.dart';
import 'package:jd_app/page/user_page1.dart';
import 'package:jd_app/page/shezhi2.dart';
import 'package:jd_app/page/registerfirst.dart';
import 'package:jd_app/page/registersecond.dart';
import 'package:jd_app/page/registerthird.dart';
//配置路由
final routes = {
  '/':(context) => IndexPage(),
  '/shezhi':(context) => SheZhiPage(),
  '/shezhi1':(context) => SheZhi1Page(),
  '/userpage1':(context) => UserPage1(),
  '/registerfirst': (context) => RegisterFistPage(),
  '/registersecond': (context) => RegisterSecondPage(),
  '/registerthird': (context) => RegisterThirdPage(),
};

var onGenerateRoute = (RouteSettings settings) {
  //统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
