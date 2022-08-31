

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_task/view/auth/login_view.dart';

import 'Language.dart';
import 'edit_profile.dart';



class ProfileHome extends StatelessWidget {
  const ProfileHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String sales = box.read("sales_name") ?? 'w';
    String sales2 = box.read("sales_email") ?? 'w';

    return Column(
      children: [
        SizedBox(height: 70),
        //ProfilePic(),
        SizedBox(height: 40),
        ProfileMenu(
          icon: "assets/User Icon.svg",
          text: "31".tr,
          press: () {
            Get.to(EditProfile());
          },
        ),

        ProfileMenu(
          icon: "assets/22.svg",
          text: "32".tr,
          press: () {

            Get.to(Language());

          },
        ),

        ProfileMenu(
          icon: "assets/Log out.svg",
          text: "34".tr,
          press: () {
            final box = GetStorage();
            box.remove('email');
            box.remove('sales_email');
            print("removed");
            FirebaseAuth.instance.signOut();
            Get.off(LoginView());
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
                color: Colors.indigoAccent,
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
              Icon(Icons.arrow_forward_ios)
            ],
          )),
    );
  }
}
