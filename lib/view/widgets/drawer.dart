

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_task/contact.dart';
import 'package:school_task/view/application_terms.dart';
import 'package:school_task/view/auth/login_view.dart';
import 'package:school_task/view/home/profile/Language.dart';
import 'package:school_task/view/home/profile/profile_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[


              // "contact":"تواصل معنا",
              // "about":"عننا",
              // "terms":"الأحكام والشروط",
              // "privacy":"سياسة الخصوصية",
              // "language":"اللغة",
              // "myprofile":"البروفايل",
              // "logout":"تسجيل الخروج",
                ListTile(
                    leading:
                    Container(
                        width:90,
                        height:90,
                        child: Image.asset("assets/contact.png",)),
                    title: Text("contact".tr,style: TextStyle(color:Colors.black,fontSize:17),),
                    onTap:(){
                    Get.to(Contact());

                    }
                ),
                SizedBox(
                  height: 10,
                ),

                ListTile(

                    leading: Container(
                        height: 90,
                        width: 90,
                        child: Image.asset("assets/sc.png")),
                    title: Text("about".tr,style: TextStyle(color:Colors.black,fontSize:17),),
                    onTap:(){
                      Get.to(AppTerms(
                        cat:"about",
                      ));
                    }
                ),
              SizedBox(
                height: 10,
              ),
                ListTile(

                    leading: Container(
                        height: 90,
                        width: 90,
                        child: Image.asset("assets/terms.png",)),
                    title: Text("terms".tr,style: TextStyle(color:Colors.black,fontSize:17),),
                    onTap:(){
                      Get.to(AppTerms(
                        cat:'terms',
                      ));
                    }
                ),
                  Divider(height:24),

              ListTile(
                onTap: () {
                  Get.to(AppTerms(
                    cat:'privacy',
                  ));
                },

                leading: Container(
                    height: 90,
                    width: 90,
                    child: Image.asset("assets/privacy.png",)),
                title: Text("privacy".tr,style: TextStyle(color:Colors.black,fontSize:17),),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                  leading: Container(
                      height: 90,
                      width: 90,
                      child: Image.asset("assets/form.jpg")),
                  title: Text("language".tr,style: TextStyle(color:Colors.black,fontSize:17),),
                  onTap: () {
                    Get.to(Language());
                  }),

              Divider(height:24),

                ListTile(
                  onTap: () {
                    Get.to(ProfileScreen());
                  },

                  leading: Container(
                    width: 90,
                    height: 90,
                    child: Image.asset("assets/pr.png",)),
                  title: Text("myprofile".tr,style: TextStyle(color:Colors.black,fontSize:17),),
                ),
              SizedBox(
                height: 10,
              ),
              ListTile(

                  leading: Container(
                      width: 90,
                      height: 90,
                      child: Image.asset("assets/logout.png",)),
                  title: Text("logout".tr,style: TextStyle(color:Colors.black,fontSize:17),),
                  onTap:(){

                    final box = GetStorage();
                    box.remove('email');
                    print("removed");
                    FirebaseAuth.instance.signOut();
                    Get.off(LoginView());
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
  sendWhatsApp(String phone, String msg) async {
    String url() {
      if (Platform.isAndroid) {
        return 'whatsapp://send?phone=$phone&text=$msg';
        //'https://app.quicktype.io/';
        //'whatsapp://send?phone=$phone&text=$msg';
        //  return 'whatsapp://wa.me/$phone/?text=${Uri.parse(msg)}';
      } else {
        return 'whatsapp://wa.me/$phone&text=$msg';
      }
    }

    await canLaunch(url()) ? launch(url()) : launch(url());

    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('there is no whats app in your device')));
  }

  sendMsg() async {
    String url() {
      if (Platform.isAndroid) {
        return 'schooly.app22@gamil.com';
        //'https://app.quicktype.io/';
        //'whatsapp://send?phone=$phone&text=$msg';
        //  return 'whatsapp://wa.me/$phone/?text=${Uri.parse(msg)}';
      } else {

        return 'schooly.app22@gamil.com';

      }
    }

    await canLaunch(url()) ? launch(url()) : launch(url());

    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('there is no whats app in your device')));
  }

}

