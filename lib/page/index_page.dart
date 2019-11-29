import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/page/cart_page.dart';
import 'package:flutter_app/page/member_page.dart';
import 'package:flutter_app/page/orderform_page.dart';
import 'package:flutter_app/page/personal_page.dart';
import 'package:flutter_app/page/search_page.dart';
import 'package:flutter_app/receiver/event_bus.dart';
import 'package:flutter_app/routes/routes.dart';
import 'package:flutter_app/utils/app_size.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/utils/dialog_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_shop_page.dart';

class IndexPage extends StatefulWidget {

  @override
  _IndexPageState createState() => _IndexPageState();
}

final List<BottomNavigationBarItem> bottomBar = <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.home,size: AppSize.width(55)), title: Text("首页")),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.search,size: AppSize.width(55)), title: Text("发现")),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart,size: AppSize.width(55)), title: Text("购物车")),
  BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled,size: AppSize.width(55)), title: Text("我的"))
];

final List<Widget> pages = <Widget>[
  HomePage(),
  SearchPage(),
  CartPage(),
  MemberPage()
];

class _IndexPageState extends State<IndexPage>  with AutomaticKeepAliveClientMixin{

  DateTime lastPopTime;
  String token;
  int currentIndex=0;

  @override
  void initState() {
    super.initState();
//    print("--*-- _IndexPageState");
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    // 初始化屏幕适配包
    AppSize.init(context);
    Screen.init(context);
    _listen();
    return WillPopScope(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: this.currentIndex,
            onTap: (index) async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              token = prefs.getString("token");
              if(index==2||index==3) {
                if(token==null){
                  Routes.instance.navigateTo(context, Routes.login_page);
                  return;
                }
                if (token.isNotEmpty) {
                  setState(() {
                    eventBus.fire(new UserLoggedInEvent("sucuss"));
                    this.currentIndex = index;
                    pageController.jumpToPage(index);
                  });
                }else{
                  Routes.instance.navigateTo(context, Routes.login_page);
                }
              }else{
                setState(() {
                  this.currentIndex = index;
                  pageController.jumpToPage(index);
                });
              }

            },
            items: bottomBar),
        body: _getPageBody(context),
      ) ,
        onWillPop: () async {
          // 点击返回键的操作
          if (lastPopTime == null ||
              DateTime.now().difference(lastPopTime) > Duration(seconds: 2)) {
            lastPopTime = DateTime.now();
            DialogUtil.buildToast('再按一次退出');
          } else {
            lastPopTime = DateTime.now();
            // 退出app
            await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          }
        },
    );

  }
  final pageController = PageController();
  _getPageBody(BuildContext context){
    return PageView(
      controller: pageController,
      children: pages,
      physics: NeverScrollableScrollPhysics(), // 禁止滑动
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  void _listen() {
    eventBus.on<IndexInEvent>().listen((event) {
      int index = int.parse(event.index);
      this.currentIndex = index;
      pageController.jumpToPage(index);
    });
  }
}
