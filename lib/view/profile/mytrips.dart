// import 'package:admob_flutter/admob_flutter.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/viewmodel/home_view_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_native_admob/flutter_native_admob.dart';
// import 'package:flutter_native_admob/native_admob_controller.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:get/get.dart';
//
// class myTrips extends StatefulWidget {
//   String email;
//
//   myTrips({this.email});
//
//   @override
//   _PostsScreenState createState() => _PostsScreenState();
// }
//
// class _PostsScreenState extends State<myTrips> {
//   String allposts;
//   String v;
//   TextEditingController _searchController = TextEditingController();
//   Future resultsLoaded;
//   List _allResults = [];
//   List _resultsList = [];
//
//   GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
//
//   final _nativeAd = NativeAdmobController();
//   AdmobBannerSize bannerSize;
//   AdmobInterstitial intersitialAd;
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   intersitialAd =AdmobInterstitial(adUnitId: AdsManger.interstitialAd,
//   //       listener:(AdmobAdEvent event , Map<String, dynamic> args ){
//   //         if(event==AdmobAdEvent.closed) intersitialAd.load();
//   //       } );
//   //   intersitialAd.load();
//   //   intersitialAd.show();
//   //   _nativeAd.reloadAd(forceRefresh:true);
//   //
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar:AppBar(
//           backgroundColor:Colors.lightBlue,
//           iconTheme: IconThemeData(
//             color: Colors.black,
//           ),
//           elevation: 12,
//           title: Text('My Trips',style:TextStyle(color:Colors.black,fontSize:22,fontWeight:FontWeight.w700),),
//         ),
//         body: Container(
//           color: Colors.white38,
//           child: Column(children: [
//             SizedBox(
//               height: 36,
//             ),
//
//             // Row(
//             //   children: [
//             //     SizedBox(
//             //       width: 20,
//             //     ),
//             //     Container(
//             //       width: 90,
//             //       //child: Image.asset('assets/sum5.png'),
//             //     ),
//             //     Container(
//             //         child: Text(
//             //       "33".tr,
//             //       style: TextStyle(
//             //           color: Colors.black,
//             //           fontSize: 30,
//             //           fontWeight: FontWeight.bold),
//             //     )),
//             //   ],
//             // ),
//
//             Flexible(
//               child: StreamBuilder(
//                   stream: FirebaseFirestore.instance
//                       .collection('orders')
//                       .where('email', isEqualTo: widget.email)
//                       .snapshots(),
//                   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (!snapshot.hasData)
//                       return Center(child: Text('Loading'));
//                     switch (snapshot.connectionState) {
//                       case ConnectionState.waiting:
//                         return new Text('Loading...');
//                       default:
//                         return ListView.builder(
//                             itemCount: snapshot.data.documents.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               DocumentSnapshot posts =
//                                   snapshot.data.documents[index];
//                               return GetBuilder<HomeViewModel>(
//                                   init: Get.find(),
//                                   builder: (controller) => Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Container(
//                                             height: 680,
//                                             child: InkWell(
//                                               child: Card(
//                                               color: Colors.white,
//                               child: Container(
//                               decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(10),
//                               topRight: Radius.circular(10),
//                               bottomLeft: Radius.circular(10),
//                               bottomRight: Radius.circular(10)
//                               ),
//                               boxShadow: [
//                               BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 5,
//                               blurRadius: 7,
//                               offset: Offset(0, 3), // changes position of shadow
//                               ),
//                               ]),
//                                                 child: Container(
//                                                   child: Column(
//                                                     children: [
//
//                                                       Container(
//                                                         width: 400,
//                                                         height: 160,
//                                                         child: Image.asset(
//                                                             "assets/pex3.jpg",
//                                                             fit: BoxFit.fill),
//                                                       ),
//                                                       SizedBox(height: 11),
//                                                       Column(
//                                                         children: [
//                                                           Row(
//                                                             children: [
//                                                               SizedBox(
//                                                                 width: 44,
//                                                               ),
//                                                               Text(
//                                                                 ("77".tr),
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                         18,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold),
//                                                               ),
//                                                               Container(
//                                                                 //width:100,
//                                                                 child: Text(
//                                                                   (posts.data()[
//                                                                           'trip'] ??
//                                                                       ""),
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                           18,
//                                                                       fontWeight:
//                                                                           FontWeight.bold),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           SizedBox(
//                                                             height: 3,
//                                                           ),
//                                                           Container(
//                                                             //width:100,
//                                                             child: Row(
//                                                               children: [
//                                                                 SizedBox(
//                                                                   width: 44,
//                                                                 ),
//                                                                 Text(
//                                                                   ("78".tr ??
//                                                                       ""),
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                           18,
//                                                                       fontWeight:
//                                                                           FontWeight.bold),
//                                                                 ),
//                                                                 //  SizedBox(width: 11,),
//                                                                 Text(
//                                                                   (posts.data()[
//                                                                           'to'] ??
//                                                                       ""),
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                           18,
//                                                                       fontWeight:
//                                                                           FontWeight.bold),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           SizedBox(
//                                                             height: 3,
//                                                           ),
//                                                           Container(
//                                                             //width:100,
//                                                             child: Row(
//                                                               children: [
//                                                                 SizedBox(
//                                                                   width: 44,
//                                                                 ),
//                                                                 Text(
//                                                                   ("79".tr ??
//                                                                       ""),
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                           18,
//                                                                       fontWeight:
//                                                                           FontWeight.bold),
//                                                                 ),
//                                                                 //  SizedBox(width: 11,),
//                                                                 Text(
//                                                                   (posts.data()[
//                                                                           'from'] ??
//                                                                       ""),
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                           18,
//                                                                       fontWeight:
//                                                                           FontWeight.bold),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           SizedBox(
//                                                             height: 3,
//                                                           ),
//                                                           Container(
//                                                             //width:100,
//                                                             child: Row(
//                                                               children: [
//                                                                 SizedBox(
//                                                                   width: 44,
//                                                                 ),
//                                                                 Text(
//                                                                   ("80".tr ??
//                                                                       ""),
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                       18,
//                                                                       fontWeight:
//                                                                       FontWeight.bold),
//                                                                 ),
//                                                                 //  SizedBox(width: 11,),
//                                                                 Text(
//                                                                   (posts.data()[
//                                                                   'type'] ??
//                                                                       ""),
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                       18,
//                                                                       fontWeight:
//                                                                       FontWeight.bold),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           SizedBox(
//                                                             height: 3,
//                                                           ),
//                                                           Container(
//                                                             //width:100,
//                                                             child: Row(
//                                                               children: [
//                                                                 SizedBox(
//                                                                   width: 44,
//                                                                 ),
//                                                                 Text(
//                                                                   ("81".tr),
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                           18,
//                                                                       fontWeight:
//                                                                           FontWeight.bold),
//                                                                 ),
//                                                                 //  SizedBox(width: 11,),
//                                                                 Text(
//                                                                   (posts.data()[
//                                                                       'num']),
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                           18,
//                                                                       fontWeight:
//                                                                           FontWeight.bold),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           SizedBox(
//                                                             height: 4,
//                                                           ),
//                                                           Row(
//                                                             children: [
//                                                               SizedBox(
//                                                                 width: 44,
//                                                               ),
//                                                               Text(
//                                                                 ("82".tr ??
//                                                                     ""),
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                         18,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold),
//                                                               ),
//                                                               Container(
//                                                                 //width:100,
//                                                                 child: Text(
//                                                                   (posts.data()[
//                                                                           'name'] ??
//                                                                       ""),
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                           18,
//                                                                       fontWeight:
//                                                                           FontWeight.bold),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           SizedBox(
//                                                             height: 4,
//                                                           ),
//                                                           Row(
//                                                             children: [
//                                                               SizedBox(
//                                                                 width: 44,
//                                                               ),
//                                                               Text(
//                                                                 ("83".tr ??
//                                                                     ""),
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                         18,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold),
//                                                               ),
//                                                               Container(
//                                                                 //width:100,
//                                                                 child: Text(
//                                                                   (posts.data()[
//                                                                           'email'] ??
//                                                                       ""),
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                           18,
//                                                                       fontWeight:
//                                                                           FontWeight.bold),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           SizedBox(
//                                                             height: 4,
//                                                           ),
//                                                           Row(
//                                                             children: [
//                                                               SizedBox(
//                                                                 width: 44,
//                                                               ),
//                                                               Text(
//                                                                 ("84".tr ??
//                                                                     ""),
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                         17,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold),
//                                                               ),
//                                                               Container(
//                                                                 //width:100,
//                                                                 child: Text(
//                                                                   (posts.data()[
//                                                                           'status'] ??
//                                                                       ""),
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                           17,
//                                                                       fontWeight:
//                                                                           FontWeight.bold),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           SizedBox(
//                                                             height: 8,
//                                                           ),
//                                                           Row(
//                                                             children: [
//                                                               SizedBox(
//                                                                   width: 32),
//                                                               Text(
//                                                                 ('85'.tr),
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                         16,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold),
//                                                               ),
//                                                               Container(
//                                                                 //width:100,
//                                                                 child: Text(
//                                                                   (posts.data()[
//                                                                           'point'] ??
//                                                                       ""),
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                           15,
//                                                                       fontWeight:
//                                                                           FontWeight.bold),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           SizedBox(
//                                                             height: 8,
//                                                           ),
//
//                                                           Row(
//                                                             children: [
//                                                               SizedBox(
//                                                                   width: 32),
//                                                               Text(
//                                                                 ('88'.tr),
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                     16,
//                                                                     fontWeight:
//                                                                     FontWeight
//                                                                         .bold),
//                                                               ),
//                                                               Container(
//                                                                 //width:100,
//                                                                 child: Text(
//                                                                   (posts.data()[
//                                                                   'date'] ??
//                                                                       ""),
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                       15,
//                                                                       fontWeight:
//                                                                       FontWeight.bold),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           SizedBox(
//                                                             height: 8,
//                                                           ),
//
//
//                                                           Row(
//                                                             children: [
//                                                               SizedBox(
//                                                                   width: 32),
//                                                               Text(
//                                                                 ('89'.tr),
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                     16,
//                                                                     fontWeight:
//                                                                     FontWeight
//                                                                         .bold),
//                                                               ),
//                                                               Container(
//                                                                 //width:100,
//                                                                 child: Text(
//                                                                   (posts.data()[
//                                                                   'time'] ??
//                                                                       ""),
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                       15,
//                                                                       fontWeight:
//                                                                       FontWeight.bold),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           SizedBox(
//                                                             height: 8,
//                                                           ),
//
//                                                           Row(
//                                                             children: [
//                                                               SizedBox(
//                                                                   width: 32),
//                                                               Text(
//                                                                 ('90'.tr),
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                     16,
//                                                                     fontWeight:
//                                                                     FontWeight
//                                                                         .bold),
//                                                               ),
//                                                               Container(
//                                                                 //width:100,
//                                                                 child: Text(
//                                                                   (posts.data()[
//                                                                   'point'] ??
//                                                                       ""),
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                       15,
//                                                                       fontWeight:
//                                                                       FontWeight.bold),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                           SizedBox(
//                                                             height: 8,
//                                                           ),
//
//                                                           Container(
//                                                             //width:100,
//                                                             child: Text(
//                                                               ('87'.tr +
//                                                                       posts.data()[
//                                                                           'total'] ??
//                                                                   ""),
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .black,
//                                                                   fontSize:
//                                                                       18,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .bold),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               )),
//                                               onTap: () {},
//                                             )),
//                                       ));
//                             });
//                     }
//                   }),
//             ),
//             //),
//             //  ]),
//           ]),
//         ));
//   }
// }
//
// //                         }
// //                       }
// //                   ),
// //                 ),
// //               //),
//
//
// //             ]),
// //       ),
//
//
// //     );
// //   }
// // }
//
