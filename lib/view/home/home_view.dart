import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_task/services/data_controller.dart';
import 'package:school_task/view/schools/details_view2.dart';
import 'package:school_task/view/schools/schools.dart';
import 'package:school_task/view/search/search_view.dart';
import 'package:school_task/view/widgets/drawer.dart';
import 'package:school_task/viewmodel/home_view_model.dart';
import '../widgets/custom_text.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class HomeView extends StatefulWidget {
  String email;
  HomeView({this.email});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isExecuted = false;
//  FirebaseMessaging fcm = FirebaseMessaging();
  double position = 280.0;
  static final customerCashManger=CacheManager(

     Config('customerCashKey',
     stalePeriod: Duration(days: 3),
       maxNrOfCacheObjects: 90,
     )
  );

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeViewModel());

    TextEditingController search_txt = new TextEditingController();

    QuerySnapshot querySnapshot;
    final box = GetStorage();
    String box_token = box.read('token') ?? "x";

    String lang = box.read("lang") ?? 'x';
    if (lang == "en") {
      position = 280.0;
    }
    if (lang == "ar") {
      position = 15.0;
    }


    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
          appBar: AppBar(
            backgroundColor:Colors.indigoAccent,
            iconTheme: IconThemeData(color: Colors.white),
            title: Container(
                height: 30,
                child: Center(
                  child:Text("SCHOOLY",style: TextStyle(color: Colors.white,fontSize:21,fontWeight:FontWeight.w600),),                 )),
          ),
          drawer: MainDrawer(),

             body: Container(

                      margin: EdgeInsets.only(right: 15, left: 15),
                      child: ListView(children: [

                        SizedBox(height: 20),

                        GetBuilder<DataController>(
                            init: DataController(),
                            builder: (controller) => _searchTextFormField()),


                        SizedBox(height: 20),

                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                        ),
                        Container(
                          // height: 220,
                          margin: EdgeInsets.only(left: 15, right: 15),
                        ),
                        _listViewCarsoul(),

                        SizedBox(height: 70),
                        Row(children: [
                          Custom_Text(
                            text: "25".tr,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Spacer(),
                          InkWell(
                            child: Custom_Text(
                              text: "26".tr,
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                            onTap: () {

                              Get.to(SchoolsView());
                            },
                          ),
                        ]),
                        SizedBox(height: 15),
                        _listViewHotels(),
                        SizedBox(height: 50),

                        // Container(
                        //     width:310,
                        //     height:82,
                        //     child:NativeAdmob(
                        //       adUnitID:AdsManger.nativeAdunit,
                        //       numberAds:3,
                        //       controller: _nativeAd,
                        //       type:NativeAdmobType.banner,
                        //     )
                        // ),
                      ]),
                    )),
    );
  }


  Widget _searchTextFormField() {
    TextEditingController search_txt = new TextEditingController();
    QuerySnapshot querySnapshot;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: GetBuilder<DataController>(
          init: DataController(),
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              TextFormField(
                controller: search_txt,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "" + "64".tr,

                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    )),
                onFieldSubmitted: (txt) {
                  search_txt.text = txt;
                  Get.to(SearchView(
                      search_txt: search_txt.text.toString())
                  );
                },
              ),


              Positioned(
                top: 10,
                left: position,
                child: InkWell(
                    child: Icon(Icons.search, color: Colors.black),
                    onTap: () {
                      controller.queryData(search_txt.text).then((value) {
                        querySnapshot = value;
                        isExecuted = true;
                        print("issss" + isExecuted.toString());
                        print("qqq=" + querySnapshot.docs.toString());
                        print("sss=" + search_txt.text.toString());
                        Get.to(SearchView(
                            search_txt: search_txt.text.toString()));
                      });
                    }),
              ),
            ]),
          )
        //}
      ),
    );
  }







  Widget _listViewCarsoul() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => Container(
        height: 200,
        //width:500,
        child: ListView.separated(
          itemCount: controller.carsoulModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              child: Container(
                height: 190,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                //  height: 150,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
                  child: Carousel(
                    borderRadius: true,
                    radius: Radius.circular(30),
                    autoplay: true,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 1250),
                    dotSize: 4.0,
                    dotIncreasedColor: Colors.indigoAccent,
                    dotBgColor: Colors.transparent,
                    noRadiusForIndicator: true,
                    dotPosition: DotPosition.bottomCenter,
                    showIndicator: true,
                    boxFit: BoxFit.fill,
                    images: [

                      CachedNetworkImage(
                        cacheManager: customerCashManger,
                        key: UniqueKey(),
                        imageUrl: controller.carsoulModel[index].img1,
                        placeholder: (context, url) =>
                            Container(
                                color:Colors.indigoAccent

                            ),
                        errorWidget: (context, url, error) => Image.asset('assets/school1.jpg'),
                        height: 80,
                        width: 90,
                        fit: BoxFit.fill,
                      ),

                      CachedNetworkImage(
                        imageUrl: controller.carsoulModel[index].img2,
                        placeholder: (context, url) =>
                            Container(
                                color:Colors.indigoAccent

                            ),
                        errorWidget: (context, url, error) => Image.asset('assets/school1.jpg'),
                        height: 80,
                        width: 90,
                        fit: BoxFit.fill,
                      ),
                      CachedNetworkImage(
                        imageUrl: controller.carsoulModel[index].img3,
                        placeholder: (context, url) =>
                            Container(
                                color:Colors.indigoAccent

                            ),
                        errorWidget: (context, url, error) => Image.asset('assets/school1.jpg'),
                        height: 80,
                        width: 90,
                        fit: BoxFit.fill,
                      ),
                      CachedNetworkImage(
                        imageUrl: controller.carsoulModel[index].img4,
                        placeholder: (context, url) =>
                            Container(
                                color:Colors.indigoAccent

                            ),
                        errorWidget: (context, url, error) => Image.asset('assets/school1.jpg'),
                        height: 80,
                        width: 90,
                        fit: BoxFit.fill,
                      ),
                      CachedNetworkImage(
                        imageUrl: controller.carsoulModel[index].img5,
                        placeholder: (context, url) =>
                            Container(
                                color:Colors.indigoAccent

                            ),
                        errorWidget: (context, url, error) => Image.asset('assets/school1.jpg'),
                        height: 80,
                        width: 90,
                        fit: BoxFit.fill,
                      ),
                      CachedNetworkImage(
                        imageUrl: controller.carsoulModel[index].img6,
                        placeholder: (context, url) =>
                            Container(
                             color:Colors.indigoAccent

                            ),
                        errorWidget: (context, url, error) => Image.asset('assets/school1.jpg'),
                        height: 80,
                        width: 90,
                        fit: BoxFit.fill,
                      ),
                     // CashedNetworkImage(controller.carsoulModel[index].img2),
                     //  NetworkImage(controller.carsoulModel[index].img3),
                     //  NetworkImage(controller.carsoulModel[index].img4),
                     //  NetworkImage(controller.carsoulModel[index].img5),
                     //  NetworkImage(controller.carsoulModel[index].img6),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewHotels() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => SingleChildScrollView(
        child: Container(
          height: 275,
          child: ListView.separated(
            itemCount: controller.productModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    // color: Colors.orange,
                    shape: BoxShape.circle),
                //height:40,
                // width: MediaQuery.of(context).size.width * .4,
                child: InkWell(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .5,
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
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ]),
                              height: 200,
                              child: Container(
                                height: 120,
                                child: Image.network(
                                    controller.productModel[index].image,
                                    fit: BoxFit.fill),
                              ),
                            ),
                            onTap: () {
                              //   intersitialAd.show();
                              Get.to
                                (DetailsView2(
                                name: controller.productModel[index].name,
                                map: controller.productModel[index].map2,
                                details: controller.productModel[index].des,
                                image: controller.productModel[index].image,
                              ));
                            }),
                        SizedBox(height: 10),


                        Custom_Text(
                          text: controller.productModel[index].name.toString(),
                          alignment: Alignment.bottomLeft,
                        ),
                        SizedBox(
                          height: 7,
                        ),

                      ],
                    ),
                  ),
                  onTap: () {
                    //intersitialAd.show();
                    Get.to(DetailsView2(
                      name: controller.productModel[index].name,
                    //  price: controller.productModel[index].price,
                      //      x:posts.data()['x'],
                      details: controller.productModel[index].des,
                      image: controller.productModel[index].image,
                  //    city: controller.productModel[index].city,
                      //    brand:posts.data()['brand'],
                      //  brandemail:posts.data()['brandemail']
                    ));
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 11,
            ),
          ),
        ),
      ),
    );
  }
}
