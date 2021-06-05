import 'package:get/get.dart';
import 'package:workshop_souenergy_flutter/ui/dash/dash_controller.dart';
import 'package:workshop_souenergy_flutter/ui/login/login_controller.dart';
import 'package:workshop_souenergy_flutter/ui/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<DashController>(() => DashController());
  }
}
