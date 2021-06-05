import 'package:get/get.dart';
import 'package:workshop_souenergy_flutter/ui/profile/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
