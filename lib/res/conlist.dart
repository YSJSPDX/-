class Post {
  final String text;
  final String img;
  final String title;

  const Post({this.title,this.text, this.img});
}

final List<Post> lists = [
  Post(
    title:"热门分类"
  ),
  Post(
    text: "全部手机", 
    img: "assets/image/classify/allphone.png"
    ),
  Post(
    text: "小米", 
    img: "assets/image/classify/miphone.png"
    ),
  Post(
    text: "华为", 
    img: "assets/image/classify/huawei.png"
    ),
  Post(
    text: "vivo", 
    img: "assets/image/classify/phone.png"
    ),
  Post(
    text: "U盘",
     img: "assets/image/classify/usb.png"
     ),
  Post(
    text: "充电宝", 
    img: "assets/image/classify/power.png"
    ),
  Post(
    text: "耳机", 
    img: "assets/image/classify/headset.png"
    ),
  Post(
    text: "路由器", 
    img: "assets/image/classify/router.png"
    ),
  
  Post(
    text: "微波炉",
     img: "assets/image/classify/microwave.png"
     ),
  Post(
    text: "电饭煲", 
    img: "assets/image/classify/cooker.png"
    ),
];
