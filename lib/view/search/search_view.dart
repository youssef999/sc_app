
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:school_task/view/schools/details_view2.dart';
import 'package:school_task/view/schools/schools.dart';
import 'package:school_task/viewmodel/home_view_model.dart';


class SearchView extends StatefulWidget {

  String search_txt;
  SearchView({this.search_txt});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}
class _PostsScreenState extends State<SearchView> {

  String allposts;
  String v;
  TextEditingController _searchController = TextEditingController();
  Future resultsLoaded;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    //final userData =FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:Colors.indigoAccent,
          iconTheme: IconThemeData(color: Colors.white),
          title: Container(
              height: 30,
              child: Center(
                child:Text("SCHOOLY",style: TextStyle(color: Colors.white,fontSize:21,fontWeight:FontWeight.w600),),                 )),
        ),
        body:
        Container(
          color: Colors.white,
          child: Column(
              children: [

                SizedBox(
                  height:20,
                ),


                Flexible(
                  child: StreamBuilder(
                      stream:
                      FirebaseFirestore.instance.
                      collection('school')
                          .where('point',arrayContains:widget.search_txt)
                          .snapshots(),

                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Center(child: Text('Loading'));
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading...');
                          default:
                           // return
                            if (snapshot.hasData && snapshot.data.docs.length > 0) {
                              return   GridView.builder(
                                  itemCount: snapshot.data.documents.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 3,
                                    mainAxisSpacing: 3,),


                                  itemBuilder: (BuildContext context, int index) {
                                    DocumentSnapshot posts =
                                    snapshot.data.documents[index];

                                    return GetBuilder<HomeViewModel>(
                                        init: Get.find(),
                                        builder: (controller) => Container(
                                            height:1400,
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
                                                  height:700,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: 230,
                                                        height: 100,
                                                        child: Image.network(
                                                            posts.data()['image'],
                                                            fit: BoxFit.fill),
                                                      ),
                                                      Column(
                                                        children: [
                                                          Center(
                                                            child: Container(
                                                              width:100,
                                                              child: Text((" "+posts.data()['name'])
                                                                ,style:TextStyle(color:Colors.black,fontSize:16,
                                                                    fontWeight:FontWeight.bold),),
                                                            ),
                                                          ),
                                                          SizedBox(height: 2),
                                                          Center(
                                                            child: Container(
                                                              width:100,
                                                              child: Text((" "+posts.data()['point'][0])
                                                                ,style:TextStyle(color:Colors.grey,fontSize:14,
                                                                    fontWeight:FontWeight.w600),),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                Get.to(DetailsView2(
                                                  name:posts.data()['name'],
                                                  details: posts.data()['des'],
                                                  map: posts.data()['map'],
                                                  image:posts.data()['image'],
                                                ));
                                              },
                                            )));
                                  });
                            }
                            else{
                              return Center(child: Text('No Data',style:TextStyle(color:Colors.black,fontSize:21),));
                              Get.to(SchoolsView());
                            }
                        }
                      }),
                ),

              ] ),
        ));
  }
}

//                         }
//                       }
//                   ),
//                 ),
//               //),


//             ]),
//       ),


//     );
//   }
// }
