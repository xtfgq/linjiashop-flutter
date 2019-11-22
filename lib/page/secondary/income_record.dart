import 'package:flutter/material.dart';
import 'package:flutter_app/utils/app_size.dart';
import 'package:flutter_app/view/app_topbar.dart';
import 'package:flutter_app/view/customize_appbar.dart';


///
/// 收益记录页
///
class IncomeRecordPage extends StatefulWidget {

  @override
  _IncomeRecordPageState createState() => _IncomeRecordPageState();
}

class _IncomeRecordPageState extends State<IncomeRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            preferredSize: Size.fromHeight(AppSize.height(160)),
            child: CommonBackTopBar(title: "收益记录",
                onBack:()=>Navigator.pop(context))
        ),
        body: Container()
    );
  }
}