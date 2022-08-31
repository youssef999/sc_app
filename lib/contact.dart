

  import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
   const Contact({Key key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor:Colors.white,
       appBar: AppBar(
         toolbarHeight: 0,
         backgroundColor: Colors.indigoAccent,
         elevation: 0,
       ),
       body:Center(
         child: Column(
           children: [
              SizedBox(
                height:70
              ),
             Container(
                width:MediaQuery.of(context).size.width,
                height:200,
                child: Image.asset("assets/school1.jpg",fit: BoxFit.fill,),
             ),
             SizedBox(
                 height:20
             ),
             Text("contact".tr,
             style:TextStyle(
               fontSize:20,
               fontWeight:FontWeight.bold,
               color:Colors.black
             )),
               SizedBox(
                 height: 20,
               ),

             Text("schooly.app22@gamil.com",
                 style:TextStyle(
                     fontSize:20,
                     fontWeight:FontWeight.bold,
                     color:Colors.black
                 )),
             SizedBox(
                 height:20
             ),
             RaisedButton(
               color:Colors.indigoAccent,
                child: Text("contact".tr,
                style:TextStyle(color:Colors.white,fontSize: 18),
                ),
                onPressed: (){

                   _launchEmail();

                },
              )

           ],
         ),
       ),
     );
   }
   Future _launchEmail() async {
     String email = "schooly.app22@gamil.com";
     final url = 'mailto:$email?subject=${Uri.encodeFull('My Subject')}'
         '&body=${Uri.encodeFull('استفسار ')}';

     if (await canLaunch(url)) {
       await launch(url);
     }
     else{
       await launch(url);
     }
   }
 }
