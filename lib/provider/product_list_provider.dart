import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jd_app/config/jd_api.dart';
import 'package:jd_app/model/product_info_model.dart';
import 'package:jd_app/net/net_request.dart';

class ProductListProvider with ChangeNotifier {
  
  bool isLoading =false;
  bool isError=false;
  String errorMsg="";
  List<ProductInfoModel>list=List();
  loadProductList() {
    isLoading=true;
    isError=false;
    errorMsg="";
    
    NetRequest().requstData(JdApi.PRODUCTIONS_LIST).then((res) {
      isLoading=false;
      if(res.code==200 && res.data is List){
        // print(res.code);
        for(var item in res.data){
          ProductInfoModel tmpModel =ProductInfoModel.fromJson(item);
          list.add(tmpModel);
        }
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
