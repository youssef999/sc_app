
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_task/constants/const.dart';
import 'package:school_task/view/auth/login_view.dart';
import 'package:school_task/viewmodel/auth_view_model.dart';
import 'package:school_task/viewmodel/control_view_model.dart';

import 'main_home.dart';

class ControlView extends StatelessWidget {
  int id;
  ControlView({this.id});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginView()
          : GetBuilder<ControlViewModel>(
              init: Get.find(),
              //ControlViewModel(),
              builder: (controller) => Scaffold(
                body:MainPage()
                //HomeView(),
                    //controller.currentScreen,
              //  bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Explore"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Image.asset('assets/home1.jpg',
                    fit: BoxFit.contain, width: 30),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/m3.png',
                    width: 30,
                  )),
              label: '',
              icon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Image.asset(
                    'assets/cat.jfif',
                    width: 30,
                  ))),
          BottomNavigationBarItem(
              activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/m3.png',
                    width: 30,
                  )),
              label: '',
              icon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Image.asset(
                    'assets/m3.png',
                    width: 30,
                  ))),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Promo code"),
              ),
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Image.asset('assets/offer.png',
                    fit: BoxFit.contain, width: 30),
              ))
        ],
        currentIndex: controller.navigotorValue,
        onTap: (index) {
          //   Get.find<AuthViewModel>().user==null
          // print("emmm = "+ controller. _user);
        //  controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: primaryColor,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
