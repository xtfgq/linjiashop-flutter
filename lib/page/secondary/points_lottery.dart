
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/app_size.dart';
import 'package:flutter_app/view/app_topbar.dart';
import 'package:flutter_app/view/customize_appbar.dart';

///
/// 积分抽奖页
///
class PointsLottery extends StatefulWidget {

  @override
  _PointsLotteryState createState() => _PointsLotteryState();
}

class _PointsLotteryState extends State<PointsLottery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            preferredSize: Size.fromHeight(AppSize.height(160)),
            child: CommonBackTopBar(title: "积分抽奖",
                onBack:()=>Navigator.pop(context))
        ),
        body: Container()
    );
  }
}
