
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:school_task/view/auth/register_view.dart';
import 'package:school_task/view/widgets/custom_button.dart';
import 'package:school_task/view/widgets/custom_textformfield.dart';

import 'package:school_task/viewmodel/auth_view_model.dart';

import 'forget_password.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.indigoAccent,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "1".tr,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Reboto"),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "3".tr,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      SizedBox(height: 20),
                      CustomTextFormField(
                          text: "4".tr,
                          hint: "5".tr,
                          obs: false,
                          onSave: (value) {
                            //   controller.email = value;
                            controller.email = value;
                          },
                          validator: (value) {
                            if (value == null) {
                              print("error");
                            }
                          }),
                      SizedBox(height: 20),
                      CustomTextFormField(
                          text: "6".tr,
                          hint: "7".tr,
                          obs: true,
                          onSave: (value) {
                            controller.password = value;
                          },
                          validator: (value) {
                            if (value == null) {
                              print("error");
                            }
                          }),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.to(ForgetPasswordView());
                            },
                            child: Text(
                              "8".tr,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Reboto"),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        onPressed: () {
                          _formKey.currentState.save();
                          if (_formKey.currentState.validate()) {
                            //controller.signInWithPhoneAndPassword();
                            controller.signInWithEmailAndPassword();
                          }
                        },
                        text: "9".tr,
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "10".tr,
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(RegisterView());
                            },
                            child: Text(
                              "11".tr,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),

                    ])),
              ],
            ),
          ),
        ))));
  }
}
