import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/page/findings_page.dart';

import 'package:flutter_app/page/orderform_page.dart';
import 'package:flutter_app/page/personal_page.dart';
import 'package:flutter_app/utils/app_size.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/view/my_icons.dart.dart';

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
  FindingsShopPage(),
  FindingsPage(),
  OrderFormPage(),
  PersonalPage()
];

class _IndexPageState extends State<IndexPage>  with AutomaticKeepAliveClientMixin{
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    print("--*-- _IndexPageState");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // 初始化屏幕适配包
    AppSize.init(context);
    Screen.init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: this.currentIndex,
          onTap: (index) {
            setState(() {
              this.currentIndex = index;
              pageController.jumpToPage(index);
            });
          },
          items: bottomBar),
      body: _getPageBody(context),
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
}
