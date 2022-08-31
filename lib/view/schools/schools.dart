
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:school_task/viewmodel/home_view_model.dart';

import 'details_view2.dart';

class SchoolsView extends StatefulWidget {
  String cat;

  SchoolsView({this.cat});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<SchoolsView> {
  String allposts;
  String v;
  Future resultsLoaded;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.indigoAccent,
          elevation: 0,
        ),
        body: Container(
          color: Colors.white38,
          child: Column(children: [
            SizedBox(
              height: 7,
            ),

            SizedBox(
              height: 7,
            ),

            Flexible(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('school')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: Text('Loading'));
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Text('Loading...');
                      default:
                        return ListView.builder(
                            itemCount: snapshot.data.documents.length,

                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot posts =
                                  snapshot.data.documents[index];

                              return GetBuilder<HomeViewModel>(
                                  init: Get.find(),
                                  builder: (controller) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height: 220,
                                        child: InkWell(
                                          child: Card(
                                            color: Colors.white,
                                            child: Container(
                                            decoration: BoxDecoration(
                                            color: Colors.white,
                              borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                              ),
                              boxShadow: [
                              BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                              ),
                              ]),
                                              child: Column(
                                                children: [

                                                  Container(
                                                    width: 420,
                                                    height: 140,
                                                    child: Image.network(
                                                        posts.data()['image'],
                                                        fit: BoxFit.fill),
                                                  ),
                                                  SizedBox(height: 12),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        //    width:100,
                                                        child: Text(
                                                          (posts
                                                              .data()['name']),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 7,
                                                      ),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                          onTap: () {
                                            
                                            Get.to(
                                                DetailsView2(
                                              name: posts.data()['name'],
                                              details: posts.data()['des'],
                                              image: posts.data()['image'],
                                              map: posts.data()['map'],
                                            ));

                                          },
                                        )),
                                  ));
                            });
                    }
                  }),
            ),
            //),
            //  ]),
          ]),
        ));
  }
}
