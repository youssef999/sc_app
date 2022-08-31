import 'dart:io';


import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:school_task/view/widgets/custom_button.dart';
import 'package:school_task/view/widgets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailsView2 extends StatefulWidget {
  String name;
  String details;
  String image;
  String map;


  DetailsView2({
    this.name,
    this.image,
    this.details,
    this.map

  });

  @override
  State<DetailsView2> createState() => _DetailsView2State();
}

class _DetailsView2State extends State<DetailsView2> {
  int index = 0;

  String lg = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.indigoAccent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Container(
            height: 30,
            child: Center(
              child:Text("SCHOOLY",style: TextStyle(color: Colors.white,fontSize:21,fontWeight:FontWeight.w600),),                 )),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 5),


            Container(
                height: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.network(widget.image, fit: BoxFit.cover))),

            //SizedBox(height: 10),

            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(17),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Custom_Text(
                              text: widget.name.toString(),
                              fontSize: 26,
                              color: Colors.black),
                          SizedBox(height:10,),

                        ],
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Custom_Text(
                            text: '40'.tr,
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 110,
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(widget.details,
                          style: TextStyle(
                              color: Colors.black, fontSize: 16)),

                      SizedBox(
                        height: 70,
                      ),

                      CustomButton(
                        onPressed: () {

                          sendMap(widget.map);

                        },
                        text: "location".tr,
                      ),
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );

  }
  sendMap (String link) async {
    String url() {
      if (Platform.isAndroid) {
        return link;
        //'https://app.quicktype.io/';
        //'whatsapp://send?phone=$phone&text=$msg';
        //  return 'whatsapp://wa.me/$phone/?text=${Uri.parse(msg)}';
      } else {
        return link;
      }
    }

    await canLaunch(url()) ? launch(url()) : launch(url());

    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('there is no whats app in your device')));
  }
}
