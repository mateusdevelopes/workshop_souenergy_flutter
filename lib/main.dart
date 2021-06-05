import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:workshop_souenergy_flutter/shared/routers/app_pages.dart';
import 'package:workshop_souenergy_flutter/shared/routers/app_routes.dart';

void main() async {
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context), // Add the locale here
        builder: DevicePreview.appBuilder, // Add the builder here
        initialRoute: AppRouters.SPLASH,
        getPages: AppPages.pages,
        // theme: ThemeData.light().copyWith(
        //   scaffoldBackgroundColor: DesignColors.BACKGROUND_COLOR,
        //   textTheme: GoogleFonts.poppinsTextTheme(Get.textTheme)
        //       .apply(bodyColor: Colors.white),
        // ),
      ), // Wrap your app
    ),
    // GetMaterialApp(
    //   initialRoute: AppRouters.ROOT,
    //   getPages: AppPages.pages,
    //   theme: ThemeData.light().copyWith(
    //     scaffoldBackgroundColor: DesignColors.BACKGROUND_COLOR,
    //     textTheme: GoogleFonts.poppinsTextTheme(Get.textTheme)
    //         .apply(bodyColor: Colors.white),
    //   ),
    //   debugShowCheckedModeBanner: false,
    // ),
  );
}
