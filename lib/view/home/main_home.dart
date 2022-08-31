

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:school_task/category/category_view.dart';
import 'package:school_task/view/home/profile/profile_screen.dart';

import 'home_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPgeState();
}

class _MainPgeState extends State<MainPage> {
  int index = 0;
  final Screens = [
    HomeView(),
    CatView(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor:Colors.white,
      body: Screens[index],
      bottomNavigationBar: GNav(
        selectedIndex: index,
        color: Colors.indigoAccent,
        onTabChange: (index) => setState(() => this.index = index),
        tabs: const [
          GButton(
            icon: Icons.home,
              iconColor:Colors.indigoAccent,
              iconActiveColor:Colors.red,
              hoverColor: Colors.redAccent,
             text: "Home",textStyle: TextStyle(color: Colors.indigoAccent,fontSize: 16,
            fontWeight:FontWeight.bold
          ),
          ),
          GButton(
            icon: Icons.local_offer_sharp,
              iconColor:Colors.indigoAccent,
            iconActiveColor:Colors.red,
              hoverColor: Colors.redAccent,
            text: "Discounts",textStyle: TextStyle(color: Colors.indigoAccent,fontSize: 16,
              fontWeight:FontWeight.bold
          ),
            //text: "City",
          ),
          // GButton(
          //   icon: Icons.favorite_border,
          //   text: "likes",
          // ),
          GButton(
            icon: Icons.person,
            iconColor:Colors.indigoAccent,
            iconActiveColor:Colors.red,
            hoverColor: Colors.redAccent,

            text: "Profile",textStyle: TextStyle(color: Colors.indigoAccent,fontSize: 16,
              fontWeight:FontWeight.bold
          ),
            // text: "my ",
          ),
        ],
      ),
    );
  }
}
