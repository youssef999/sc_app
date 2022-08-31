
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_task/locale/locale_controller.dart';

import '../main_home.dart';

class LanguageBody extends StatelessWidget {
  const LanguageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyLoacleController controllerLang = Get.find();

    return Column(
      children: [
        SizedBox(height: 70),
        //ProfilePic(),
        SizedBox(height: 40),
        ProfileMenu(
          icon: "assets/arabic.svg",
          text: "58".tr,
          press: () {
            controllerLang.ChangeLang("ar");
            Get.off(MainPage());

          },
        ),
        ProfileMenu(
          icon: "assets/english-11.svg",
          text: "59".tr,
          press: () {
            controllerLang.ChangeLang("en");
            Get.off(MainPage());


          },
        ),
      ],
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.press,
    Null Function() onpress,
  }) : super(key: key);
  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color(0xFFF5F6F9),
          onPressed: press,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 22,
                color: Colors.indigoAccent
              ),
              SizedBox(width: 20),
              Expanded(
                  child: Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              )),
              // Icon(Icons.arrow_forward_ios)
            ],
          )),
    );
  }
}
