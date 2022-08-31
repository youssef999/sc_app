

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';

import 'Language_body.dart';

class Language extends StatelessWidget {
  const Language({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("57".tr),
        titleTextStyle: TextStyle(color: Colors.indigoAccent, fontSize: 18),
      ),
      backgroundColor: Colors.white,
      body: LanguageBody(),
    );
  }
}
