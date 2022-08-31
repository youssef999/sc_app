import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get_storage/get_storage.dart';


class AppTerms extends StatefulWidget {

  String cat;

  AppTerms({this.cat});

   @override
   State<AppTerms> createState() => _AppTermsState();
 }

 class _AppTermsState extends State<AppTerms> {

  String pdf ;




  @override
  void initState() {
    final box=GetStorage();
    String lang=box.read('lang');

    if(widget.cat=='terms'){
      pdf='assets/terms and conditions.pdf';
    }
    if(widget.cat=='privacy'){
      pdf='assets/privacy policy.pdf';
    }
    if(widget.cat=='contact'){
      pdf='assets/contact.pdf';
    }

    if(widget.cat=='about' && lang == 'en'){
      pdf='assets/about us.pdf';
    }

    if(widget.cat=='about' && lang == 'ar'){
      pdf='assets/mn.pdf';
    }

    super.initState();
  }


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
         color:Colors.white,
         child:PDF(

           enableSwipe: true,
           //swipeHorizontal:true,
           autoSpacing: false,
           pageFling: false,
         ).fromAsset(
           pdf,
           errorWidget: (dynamic error) => Center(child: Text(error.toString())),
         ),
       ),
     );
   }
 }
