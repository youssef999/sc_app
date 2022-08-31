
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_task/view/auth/register_view.dart';
import 'package:school_task/view/widgets/custom_button.dart';
import 'package:school_task/view/widgets/custom_textformfield.dart';
import 'package:school_task/viewmodel/auth_view_model.dart';

import 'login_view.dart';

class ForgetPasswordView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         // baccolor: Colors.indigoAccent,
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.indigoAccent,
          title: Text("8".tr),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back, color: Colors.black),
            onTap: () {
              Get.off(LoginView());
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  Text(
                    "8".tr,
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
                    "52".tr,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 80),
                  CustomTextFormField(
                      text: "4".tr,
                      hint: "5".tr,
                      obs: false,
                      onSave: (value) {
                        controller.email = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          print("error");
                        }
                      }),
                  SizedBox(height: 100),
                  CustomButton(
                    onPressed: () {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        controller.ResetPassword();
                      }
                    },
                    text: "53".tr,
                  ),
                  SizedBox(
                    height: 50,
                  ),
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
                          "2".tr,
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ])),
          ),
        ));
  }
}
