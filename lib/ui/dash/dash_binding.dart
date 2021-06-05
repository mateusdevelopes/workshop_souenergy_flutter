import 'package:get/get.dart';
import 'package:workshop_souenergy_flutter/ui/dash/dash_controller.dart';
import 'package:workshop_souenergy_flutter/ui/feed/feed_controller.dart';
import 'package:workshop_souenergy_flutter/ui/profile/profile_controller.dart';

class DashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashController>(() => DashController());
    Get.lazyPut<FeedController>(() => FeedController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
