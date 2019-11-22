
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/app_size.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/view/app_topbar.dart';
import 'package:flutter_app/view/customize_appbar.dart';


///
/// 商家直播页
///
class StoreLive extends StatefulWidget {

  @override
  _StoreLiveState createState() => _StoreLiveState();
}

class _StoreLiveState extends State<StoreLive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            preferredSize: Size.fromHeight(AppSize.height(160)),
            child: CommonBackTopBar(title: "商家直播",
                onBack:()=>Navigator.pop(context))
        ),
        body: Container()
    );
  }
}
