
import 'package:get/get.dart';
import 'package:school_task/viewmodel/auth_view_model.dart';
import 'package:school_task/viewmodel/control_view_model.dart';
import 'package:school_task/viewmodel/home_view_model.dart';

class Binding extends Bindings
{
  @override
  void dependencies() {

     Get.lazyPut(() => AuthViewModel());
     Get.lazyPut(() => ControlViewModel());
     Get.lazyPut(() => AuthViewModel());
     Get.lazyPut(() => HomeViewModel());

  }
}