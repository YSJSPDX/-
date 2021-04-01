import 'package:flutter/material.dart';
import 'package:jd_app/page/loadpage.dart';
import 'package:jd_app/provider/bottom_navi_provider.dart';
import 'package:jd_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: BottomNaviProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (context) {
            CartProvider provider = new CartProvider();
            provider.getCartList();
            return provider;
          },
        )
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '智租',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: Colors.red[300],
        primaryColorBrightness: Brightness.light,
      ),
      home: SplashPage(),
    );
  }
}
