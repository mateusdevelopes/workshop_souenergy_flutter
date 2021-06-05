import 'package:get/get.dart';
import 'package:workshop_souenergy_flutter/ui/feed/feed_controller.dart';

class FeedBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FeedController());
  }
}
