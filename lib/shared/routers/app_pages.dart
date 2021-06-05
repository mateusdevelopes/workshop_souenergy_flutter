import 'package:get/get.dart';
import 'package:workshop_souenergy_flutter/shared/routers/app_routes.dart';
import 'package:workshop_souenergy_flutter/ui/dash/dash_binding.dart';
import 'package:workshop_souenergy_flutter/ui/dash/dash_page.dart';
import 'package:workshop_souenergy_flutter/ui/login/login_binding.dart';
import 'package:workshop_souenergy_flutter/ui/login/login_page.dart';
import 'package:workshop_souenergy_flutter/ui/splash/splash_binding.dart';
import 'package:workshop_souenergy_flutter/ui/splash/splash_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRouters.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRouters.DASH,
      page: () => DashPage(),
      binding: DashBinding(),
    ),
    GetPage(
      name: AppRouters.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
