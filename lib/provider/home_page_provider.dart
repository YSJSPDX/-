import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:jd_app/config/jd_api.dart';
import 'package:jd_app/model/home_page_model.dart';
import 'package:jd_app/net/net_request.dart';

class HomePageProvider with ChangeNotifier {
  HomePageModel model;
  bool isLoading =false;
  bool isError=false;
  String errorMsg="";

  loadHomePageData() {
    isLoading=true;
    isError=false;
    errorMsg="";
    NetRequest().requstData(JdApi.HOME_PAGE).then((res) {
      isLoading=false;
      if(res.code==200){
        // print(res.code);
        model=HomePageModel.fromJson(res.data);
        // print(model.toJson());
      }
      notifyListeners();
    }).catchError((error){
      print(error);
      errorMsg=error;
      isLoading=false;
      isError=true;
      notifyListeners();
    });
  }
}
