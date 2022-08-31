
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_task/view/auth/login_view.dart';
import 'package:school_task/view/home/main_home.dart';
import 'package:school_task/viewmodel/auth_view_model.dart';
import 'helper/binding.dart';
import 'locale/locale.dart';
import 'locale/locale_controller.dart';
import 'viewmodel/control_view_model.dart';

 Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(MyLoacleController());
  Get.put(ControlViewModel());
  Get.put(AuthViewModel());
  await GetStorage.init();
  runApp(MyApp());
 }

 class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
  }

class _MyAppState extends State<MyApp> {
  MyLoacleController controllerLang = Get.find();


  @override
  void initState() {

    super.initState();
    new Future.delayed(new Duration(seconds: 4), () {
      print("xxxx");
      final box = GetStorage();
      String user = box.read("email") ?? 'x';
      String lang=box.read("lang") ?? 'x';

      if(lang=="en"){
        controllerLang.ChangeLang("en");
      }
      if(lang=="ar"){
        controllerLang.ChangeLang("ar");
      }

      if(lang=="x"){
      print("x");
      }

      if (user == 'x' ) {
        print("user=" + user.toString());
        Get.off(LoginView());
      }

      if(user != 'x')
      {
        Get.off(MainPage());
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MyLoacleController());
    return GetMaterialApp(
        locale: Get.deviceLocale,
        translations: MyLocale(),
        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor:  Colors.white,
            body: Container(
          height: 1000,
          width: 500,
          color: Colors.white,
          child: Image.asset('assets/schooly-logo.png', fit: BoxFit.contain),
        ))

        );
  }
}
//mvvm ----> model View viewModel

