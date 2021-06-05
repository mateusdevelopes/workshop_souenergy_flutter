import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:workshop_souenergy_flutter/shared/design/design_assets.dart';
import 'package:workshop_souenergy_flutter/ui/splash/splash_binding.dart';
import 'package:workshop_souenergy_flutter/ui/splash/splash_page.dart';

class ProfileController extends GetxController {
  final GetStorage _box = GetStorage();
  var name = "Mateus Lopes";

  @override
  void onInit() {
    super.onInit();
  }

  logOut() {
    _box.erase();
    Get.off(SplashPage(), binding: SplashBinding());
  }
}
