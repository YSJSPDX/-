import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jd_app/model/home_page_model.dart';
import 'package:jd_app/page/category_page.dart';
import 'package:jd_app/provider/home_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // NetRequest();
    // NetRequest().requstData(JdApi.HOME_PAGE).then((res) => print(res.msg));

    return ChangeNotifierProvider<HomePageProvider>(
      create: (context) {
        var provider = new HomePageProvider();
        provider.loadHomePageData();
        return provider;
      },
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            title: Text('智租'),

            centerTitle: true,
            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(Icons.question_answer),
            //     onPressed: () {},
            //   ),
            // ],
          ),
          preferredSize: Size.fromHeight(40.0),
        ),

        //搜索框
        floatingActionButton: Container(
          height: 30,
          width: 350,
          child: Center(
              child: InkWell(
            child: Icon(Icons.search),
            onTap: () {
              showSearch(context: context, delegate: SearchBarDelegate());
            },
          )),
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(bottom: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        body: Container(
          color: Color(0xFFf4f4f4),
          child: Consumer<HomePageProvider>(builder: (_, provider, __) {
            //print(provider.isLoading)
            //加载动画
            if (provider.isLoading) {
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
                        provider.loadHomePageData();
                      },
                    )
                  ],
                ),
              );
            }

            HomePageModel model = provider.model;
            // print(model.toJson());
            return ListView(
              children: <Widget>[
                //轮播图
                buildAspectRatio(model),
                //图标分类
                buildLogos(model),

                //广告1
                // buildADs(model.pageRow.ad1),
                //广告2
                // buildADs(model.pageRow.ad2),
                //掌上秒杀头部
                buildMSheaderContainer(),
                //掌上秒杀商品
                buildMSbodyContainer(model),
                SizedBox(height: 10),
                //商品推荐
                buildTJbodyContainer(),
                buildTJbodyContainer(),
                buildTJbodyContainer(),
                buildTJbodyContainer(),
                buildTJbodyContainer(),
                buildTJbodyContainer(),
                buildTJbodyContainer(),
                buildTJbodyContainer(),
                buildTJbodyContainer(),
                buildTJbodyContainer(),
                SizedBox(height: 50)
              ],
            );
            // return Container();
          }),
        ),
        //首页菜单栏
        // drawer: Drawer(
        //     child: Column(
        //   children: <Widget>[
        //     Row(
        //       children: <Widget>[
        //         Expanded(
        //             child: UserAccountsDrawerHeader(
        //           accountName: Text("艺术就是派大星"),
        //           accountEmail: Text("YSJSPDX@123.com"),
        //           currentAccountPicture: CircleAvatar(
        //             backgroundImage: NetworkImage(
        //                 "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F201912%2F03%2F20191203182404_nxlxp.thumb.400_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1614495390&t=ce761ec6703db60d837b06966b95aa02"),
        //           ),
        //           decoration: BoxDecoration(
        //               color: Colors.black,
        //               image: DecorationImage(
        //                   image: NetworkImage(
        //                       "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1603095301,628679978&fm=26&gp=0.jpg"),
        //                   fit: BoxFit.cover)),
        //           otherAccountsPictures: <Widget>[
        //             Image.network(
        //                 "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=205537929,753118866&fm=15&gp=0.jpg")
        //           ],
        //         ))
        //       ],
        //     ),
        //     ListTile(
        //       leading: CircleAvatar(child: Icon(Icons.home)),
        //       title: Text('我的空间'),
        //       onTap: () {},
        //     ),
        //     Divider(),
        //     ListTile(
        //       leading: CircleAvatar(child: Icon(Icons.people)),
        //       title: Text('用户中心'),
        //       onTap: () {
        //         // Navigator.of(context).pop();
        //         // Navigator.pushNamed(context, '/user');
        //       },
        //     ),
        //     Divider(),
        //     ListTile(
        //       leading: CircleAvatar(child: Icon(Icons.settings)),
        //       title: Text('设置中心'),
        //       onTap: () {},
        //     ),
        //   ],
        // )),
      ),
    );
  }

  //广告
  Widget buildADs(List<String> ads) {
    List<Widget> list = List<Widget>();
    for (var i = 0; i < ads.length; i++) {
      list.add(Expanded(
        child: Image.asset("assets${ads[i]}"),
      ));
    }
    return Row(
      children: list,
    );
  }

  //掌上秒杀商品
  Container buildMSbodyContainer(HomePageModel model) {
    return Container(
      height: 120,
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/image/sanxin.jpg",
                  width: 85,
                  height: 85,
                ),
                Text(
                  "￥20/天",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/image/classify/power.png",
                  width: 85,
                  height: 85,
                ),
                Text(
                  "￥2/小时",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/image/zhenzhuang.jpg",
                  width: 85,
                  height: 85,
                ),
                Text(
                  "￥20/天",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/image/iphone.jpg",
                  width: 85,
                  height: 85,
                ),
                Text(
                  "￥15.8/天",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/image/hanfu.jpg",
                  width: 85,
                  height: 85,
                ),
                Text(
                  "￥25/天",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/image/shoubiao.jpg",
                  width: 85,
                  height: 85,
                ),
                Text(
                  "￥89/天",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/image/meizu.jpg",
                  width: 85,
                  height: 85,
                ),
                Text(
                  "￥8.69/天",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/image/lianxiang.jpg",
                  width: 85,
                  height: 85,
                ),
                Text(
                  "￥9/天",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildMSheaderContainer() {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      height: 50,
      child: Row(
        children: <Widget>[
          // Image.asset(
          //   "assets/image/cart.png",
          //   width: 90,
          //   height: 50,
          // ),
          Spacer(),
          Text("更多推荐"),
          Icon(
            CupertinoIcons.right_chevron,
            size: 14,
          ),
        ],
      ),
    );
  }
//图标分类

  Widget buildLogos(HomePageModel model) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                width: 60.0,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/image/logo1.png",
                      width: 50,
                      height: 50,
                    ),
                    Text("数码产品")
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 60.0,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/image/logo2.png",
                      width: 50,
                      height: 50,
                    ),
                    Text("服饰配饰")
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 60.0,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/image/logo3.png",
                      width: 50,
                      height: 50,
                    ),
                    Text("生活电器")
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 60.0,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/image/logo4.png",
                      width: 50,
                      height: 50,
                    ),
                    Text("共享出行")
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                child: Container(
                  width: 60.0,
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/image/logo5.png",
                        width: 50,
                        height: 50,
                      ),
                      Text("全部商品")
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) {
                      //指定跳转的页面
                      return CategoryPage();
                    },
                  ));
                },
              ),
            ),
          ],
        )
      ],
    );
  }

//轮播图
  AspectRatio buildAspectRatio(HomePageModel model) {
    List _imageurls = [
      "assets/image/x1.jpg",
      "assets/image/x2.jpg",
      "assets/image/x3.jpg",
      "assets/image/x4.jpg",
      "assets/image/x5.jpg",
    ];
    return AspectRatio(
      aspectRatio: 72 / 30,
      child: Swiper(
        itemCount: model.swipers.length,
        pagination: SwiperPagination(),
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            _imageurls[index],
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }

  //推荐商品
  Widget buildTJbodyContainer() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 20.0,
              // margin: EdgeInsets.only(left: 15),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/image/iphone.jpg",
                    width: 160.0,
                    height: 160.0,
                  ),
                  Text("Apple苹果iPhone12 64g"),
                  Text("128g 256g国行手机全新"),
                  Text(
                    "￥15.8/天        原价6299",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Card(
              elevation: 20.0,
              // margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/image/sanxin.jpg",
                    width: 160.0,
                    height: 160.0,
                  ),
                  Text("三星 Galaxy S21 Ultra 5G"),
                  Text("支持Spen 12G+256G"),
                  Text(
                    "￥20/天        原价3599",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 20.0,
              // margin: EdgeInsets.only(left: 15),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/image/lianxiang.jpg",
                    width: 160.0,
                    height: 160.0,
                  ),
                  Text("联想拯救者电竞手机Pro "),
                  Text("90W适配器 144Hz电竞屏"),
                  Text(
                    "￥9/天        原价3599",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Card(
              elevation: 20.0,
              // margin: EdgeInsets.only(right: 15),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/image/jianguo.jpg",
                    width: 160.0,
                    height: 160.0,
                  ),
                  Text("坚果 R2 8GB+128GB 浅黑"),
                  Text("双系统双模5G旗舰手机"),
                  Text(
                    "￥8.69/天        原价4399",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 20.0,
              // margin: EdgeInsets.only(left: 15),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/image/meizu.jpg",
                    width: 160.0,
                    height: 160.0,
                  ),
                  Text("魅族17 Pro 12GB+256GB"),
                  Text("定白 骁龙865 旗舰5G手机"),
                  Text(
                    "￥8.69/天        原价3418",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Card(
              elevation: 20.0,
              // margin: EdgeInsets.only(right: 15),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/image/ace.jpg",
                    width: 160.0,
                    height: 160.0,
                  ),
                  Text("OPPO Ace2 8+128高通"),
                  Text("骁龙865 双模5G185g超薄"),
                  Text(
                    "￥5.99/天        原价2869",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 20.0,
              // margin: EdgeInsets.only(left: 15),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/image/oneplus.jpg",
                    width: 160.0,
                    height: 160.0,
                  ),
                  Text("一加手机 OnePlus 8T"),
                  Text("5G旗舰 120Hz柔性直屏"),
                  Text(
                    "￥9.24/天        原价3699",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Card(
              elevation: 20.0,
              // margin: EdgeInsets.only(right: 15),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "assets/image/iq.jpg",
                    width: 160.0,
                    height: 160.0,
                  ),
                  Text("vivo iQOO 7 12GB+256GB"),
                  Text("骁龙888 120W超快闪充"),
                  Text(
                    "￥9.9/天        原价4399",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
