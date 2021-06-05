import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:workshop_souenergy_flutter/ui/dash/dash_binding.dart';
import 'package:workshop_souenergy_flutter/ui/dash/dash_page.dart';
import 'package:workshop_souenergy_flutter/ui/login/login_binding.dart';
import 'package:workshop_souenergy_flutter/ui/login/login_page.dart';

class SplashController extends GetxController {
  final GetStorage _box = GetStorage();

  @override
  void onInit() {
    checkHasLoggedUser();
    super.onInit();
  }

  checkHasLoggedUser() {
    print("SEGUE FAKE TOKEN" + _box.read("token"));
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (_box.hasData('token')) {
          Get.off(DashPage(), binding: DashBinding());
        } else {
          Get.off(LoginPage(), binding: LoginBinding());
        }
      },
    );
  }
}
