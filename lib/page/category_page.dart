import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jd_app/model/category_content_model.dart';
import 'package:jd_app/page/product_list_page.dart';
import 'package:jd_app/provider/category_page_provider.dart';
import 'package:jd_app/provider/product_list_provider.dart';
import 'package:jd_app/res/list.dart';
import 'package:provider/provider.dart';


class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    // NetRequest();
    // NetRequest().requstData(JdApi.HOME_PAGE).then((res) => print(res.msg));

    return ChangeNotifierProvider<CategoryPageProvider>(
      create: (context) {
        var provider = new CategoryPageProvider();
        provider.loadCategoryPageData();
        return provider;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('分类'),
        ),
        body: Container(
          color: Color(0xFFf4f4f4),
          child: Consumer<CategoryPageProvider>(builder: (_, provider, __) {
            //print(provider.isLoading)
            //加载动画
            if (provider.isLoading && provider.categoryNavList.length == 0) {
              return Center(child: CupertinoActivityIndicator());
            }
            //捕获异常
            if (provider.isError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(provider.errorMsg),
                    OutlineButton(
                      child: Text('刷新'),
                      onPressed: () {
                        provider.loadCategoryPageData();
                      },
                    )
                  ],
                ),
              );
            }
            return Row(children: <Widget>[
              //分类左侧
              buildNavLeftContainer(provider),
              //分类右侧
              Expanded(
                  child: Stack(
                children: <Widget>[
                  buildCategoryContent(provider.categoryContentList),
                  provider.isLoading
                      ? Center(
                          child: CupertinoActivityIndicator(),
                        )
                      : Container()
                ],
              ))
            ]);
          }),
        ),
      ),
    );
  }

  //右侧
  Widget buildCategoryContent(List<CategoryContentModel> contentList) {
    List<Widget> list = List<Widget>();

    //处理数据
    for (var i = 0; i < contentList.length; i++) {
      list.add(Container(
        height: 30.0,
        margin: const EdgeInsets.only(left: 10.0, top: 10.0),
        child: Text(
          "${contentList[i].title}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ));
      //商品数据容器
      List<Widget> descList = List<Widget>();
      for (var j = 0; j < contentList[i].desc.length; j++) {
        descList.add(InkWell(
          child: Container(
            width: 60.0,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets${contentList[i].desc[j].img}",
                  width: 50.0,
                  height: 50.0,
                ),
                Text("${contentList[i].desc[j].text}")
              ],
            ),
          ),
          onTap: () {
            //前往商品页面
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=>
              ChangeNotifierProvider<ProductListProvider>(
                create: (context){
                  ProductListProvider provider=ProductListProvider();
                  provider.loadProductList();
                  return provider;
                },
                child:  Consumer<ProductListProvider>(
                  builder: (_,provider,__){
                    return Container(
                      child:ProductListPage(title:contentList[i].desc[j].text) ,
                    );
                  },
                ),
              )
              
              ));
          },
        ));
      }

      //将descList追加到List数据中
      list.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 7.0,
          runSpacing: 10.0,
          alignment: WrapAlignment.start,
          children: descList,
        ),
      ));
    }

    return Container(
      width: double.infinity,
      color: Colors.white,
      child: ListView(
        children: list,
      ),
    );
  }

  //左侧
  Container buildNavLeftContainer(CategoryPageProvider provider) {
    return Container(
      width: 90,
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Container(
                  height: 50.0,
                  padding: const EdgeInsets.only(top: 15),
                  color: provider.tabIndex == index
                      ? Colors.white
                      : Color(0xFFF8F8F8),
                  child: Text(
                    posts[index].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: provider.tabIndex == index
                            ? Color(0xFFe93b3d)
                            : Color(0xFF333333),
                        fontWeight: FontWeight.w500),
                  )),
              onTap: () {
                // print(index);
                provider.loadCategoryContentData(index);
              },
            );
          }),
    );
  }
}
