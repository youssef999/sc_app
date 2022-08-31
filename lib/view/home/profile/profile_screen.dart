
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_task/view/home/profile/profile.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.indigoAccent,
        elevation: 0,
      ),
      body: ProfileHome(),
    );
  }
}
