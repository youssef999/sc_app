
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_task/view/widgets/custom_textformfield.dart';
import 'package:school_task/viewmodel/auth_view_model.dart';

import 'login_view.dart';


class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text("11".tr),
          titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
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
          padding: EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
          child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Text(
                  "15".tr,
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
                  "16".tr,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                CustomTextFormField(
                    text: "17".tr,
                    hint: "18".tr,
                    obs: false,
                    onSave: (value) {
                      controller.name = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length <3) {
                        return "Incorrect name at least 3 characters";
                      }
                    }),
                SizedBox(height: 20),
                CustomTextFormField(
                    text: "4".tr,
                    hint: "5".tr,
                    obs: false,
                    onSave: (value) {
                      controller.email = value;
                    },
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return "Incorrect email";
                      }
                    }),
                SizedBox(height: 20),
                CustomTextFormField(
                    text: "phone".tr,
                    hint: "enterphone".tr,
                    obs: false,
                    onSave: (value) {
                      controller.phone = value;
                    },
                    validator: (value) {
                      if (value == null || value.length < 9) {
                        return "Incorrect phone number";
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
                      if (value == null || value.length < 6) {
                       return "Incorrect password must be at least 6 characters";
                      }
                    }),
                SizedBox(height: 20),

             RaisedButton(
                 color: Colors.indigoAccent,
                 shape: RoundedRectangleBorder(
                     borderRadius:
                     BorderRadius.circular(15)),
                 child: Text(
                   "11".tr,
                   style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                       color: Colors.white),
                 ),
                 onPressed: () async {
                   _formKey.currentState.save();
                   if (_formKey.currentState.validate()) {
                           controller
                               .createAccountWithEmailAndPassword();
                       }
                   }),






             //   _listViewCodes(),
                SizedBox(height: 20),
                // CustomButton(
                //   onPressed: () {
                //     _formKey.currentState.save();
                //     if (_formKey.currentState.validate()) {
                //      controller.createAccountWithPhoneAndPassword();
                //     //  controller.createAccountWithEmailAndPassword();
                //
                //     }
                //   },
                //   text: "Sign Up",
                // ),
                SizedBox(height: 20),
              ])),
        )));
  }

}
