import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jd_app/config/jd_api.dart';
import 'package:jd_app/model/product_detail_model.dart';
import 'package:jd_app/net/net_request.dart';


class ProductDetailProvider with ChangeNotifier {
  ProductDetailModel model;
  bool isLoading =false;
  bool isError=false;
  String errorMsg="";
  loadProduct({String id}) {
    isLoading=true;
    isError=false;
    errorMsg="";
    
    NetRequest().requstData(JdApi.PRODUCTIONS_DETAIL).then((res) {
      isLoading=false;
      if(res.code==200 && res.data is List){
        // print(res.code);
        for(var item in res.data){
          ProductDetailModel tmpModel =ProductDetailModel.fromJson(item);
          if(tmpModel.partData.id==id){
            model=tmpModel;
          }
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

  //分期切换
  void changeBaitiaoSelected(int index){
    if(this.model.baitiao[index].select==false){
      for(int i=0;i<this.model.baitiao.length;i++){
        if(i == index){
          this.model.baitiao[i].select=true;
        }else{
          this.model.baitiao[i].select=false;
        }
      }
      notifyListeners();
    }
  }

  //数量赋值
  void changeProductCount(int count){
    if(count>0 && this.model.partData.count != count){
      this.model.partData.count=count;
      notifyListeners();
    }
  }
}
