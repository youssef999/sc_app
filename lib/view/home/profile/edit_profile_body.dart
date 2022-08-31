import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_task/view/home/main_home.dart';

class BodyEdit extends StatelessWidget {
  String name, email,phone;
  BodyEdit({this.name, this.email,this.phone});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "35".tr,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 20,
                ),
                MenuForm(
                  name: name,
                  email: email,
                  phone: phone,
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuForm extends StatefulWidget {
  String name, email,phone;

  MenuForm({this.name, this.email,this.phone});

  @override
  State<MenuForm> createState() => _MenuFormState();
}

class _MenuFormState extends State<MenuForm> {
  final List<String> errors = [];
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password_check = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [

          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "4".tr,
              enabled: false,
              hintText: widget.email ?? "",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 42,
                vertical: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(
                    color: Colors.indigoAccent
                ),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(
                    color: Colors.indigoAccent
                ),
                gapPadding: 10,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(widget.phone ?? "xx",
            style: TextStyle(color: Colors.black54, fontSize: 16),),
          SizedBox(
            height: 5,
          ),
          Text(
            "changephone".tr,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            textAlign: TextAlign.start,
          ),


          SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: phone,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "newphone".tr,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 42,
                vertical: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(
                    color: Colors.indigoAccent
                ),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(
                  color: Colors.indigoAccent
                ),
                gapPadding: 10,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 56,
              width: double.infinity,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.indigoAccent,
                  onPressed: () {
                    if(phone.text != null && phone.text !='' && phone.text.length>8){

                      changePhone(phone.text);
                      Get.off(MainPage());

                    }

                  },
                  child: Text(
                    "39".tr,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "36".tr,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "37".tr,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 42,
                vertical: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(
                    color: Colors.indigoAccent
                ),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(
                  color: Colors.indigoAccent
                ),
                gapPadding: 10,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: password_check,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "38".tr,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 42,
                vertical: 20,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(
                  color: Colors.indigoAccent
                ),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(
                  color: Colors.indigoAccent
                ),
                gapPadding: 10,
              ),
            ),
          ),
          ////////////////////
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 56,
              width: double.infinity,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.indigoAccent,
                  onPressed: () {
                    if (password_check.text.toString() !=
                        password.text.toString()) {
                      Get.snackbar('Wrong!!! ', '  الباسورد غير مطابق ',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white);
                    } else {
                      changePawword();
                      Get.off(MainPage());
                    }
                  },
                  child: Text(
                    "39".tr,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  changePawword() async {
    User user = FirebaseAuth.instance.currentUser;
    print("user" + user.toString());
    await user.updatePassword(password.text.toString());
    Get.snackbar('تم ', ' تم تغير الباسورد بنجاح ',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.lime,
        colorText: Colors.white);
    // Get.off(EditProfile());
    // FirebaseAuth.instance.signOut();
    // Get.offAll(ControlView());
  }

  changePhone(String newphone) async {
    User user = FirebaseAuth.instance.currentUser;
    print("user" + user.toString());
    Firestore.instance
        .collection('users')
        .where("email", isEqualTo:widget.email).get()
        .then((snapshot) async {
      snapshot
          .docs.first.reference
          .update({'phone': newphone});
      final box = GetStorage();
      box.remove('phone');

       box.write('phone',newphone);

      Get.snackbar('تم ', ' تم تغير رقمك بنجاح ',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.lime,
          colorText: Colors.white);

      Get.off(MainPage());
      // FirebaseAuth.instance.signOut();
      // Get.offAll(ControlView());
    });
  }
}
