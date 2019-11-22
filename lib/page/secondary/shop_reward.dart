import 'package:flutter/material.dart';
import 'package:flutter_app/utils/app_size.dart';
import 'package:flutter_app/view/app_topbar.dart';
import 'package:flutter_app/view/customize_appbar.dart';


///
/// 门店奖励页
///
class ShopRewardPage extends StatefulWidget {

  @override
  _ShopRewardPageState createState() => _ShopRewardPageState();
}

class _ShopRewardPageState extends State<ShopRewardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            preferredSize: Size.fromHeight(AppSize.height(160)),
            child: CommonBackTopBar(title: "门店奖励",
                onBack:()=>Navigator.pop(context))
        ),
        body: Container()
    );
  }
}