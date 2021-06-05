import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Responsive extends GetView {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  // This size work fine on my design, maybe you need some customization depends on your design
  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(_) => Get.width < 850;
  static bool isTablet(_) => Get.width < 1100 && Get.width >= 850;
  static bool isDesktop(_) => Get.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size _size = Get.size;
    // If our width is more than 1100 then we consider it a desktop
    if (_size.width >= 1100) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (_size.width >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}