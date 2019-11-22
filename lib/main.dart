import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/res/colours.dart';

import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_app/page/index_page.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }

  FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IndexPage(),
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
      ),
    );
  }
}
