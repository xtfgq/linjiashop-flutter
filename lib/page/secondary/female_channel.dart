import 'package:flutter/material.dart';
import 'package:flutter_app/utils/app_size.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/view/app_topbar.dart';
import 'package:flutter_app/view/customize_appbar.dart';


///
/// 女性课堂页
///
class FemaleClassroom extends StatefulWidget {

  @override
  _FemaleClassroomState createState() => _FemaleClassroomState();
}

class _FemaleClassroomState extends State<FemaleClassroom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            preferredSize: Size.fromHeight(AppSize.height(160)),
            child: CommonBackTopBar(title: "女性课堂",
                onBack:()=>Navigator.pop(context))
        ),
        body: Container()
    );
  }
}
