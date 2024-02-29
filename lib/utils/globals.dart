import 'package:get/get.dart';
import 'package:second_app/controllers/home_controller.dart';
import 'package:second_app/controllers/second_cntroller.dart';

void initControllers() {
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => SecondController());
}
