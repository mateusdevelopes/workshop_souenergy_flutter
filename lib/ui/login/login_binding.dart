import 'package:get/get.dart';
import 'package:workshop_souenergy_flutter/ui/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put<IAuthRepository>(AuthRepository());
    // Get.put(LoginController(Get.find()));
    Get.put(LoginController());
  }
}
