import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workshop_souenergy_flutter/shared/design/design_assets.dart';
import 'package:workshop_souenergy_flutter/ui/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 10,
                ),
                child: Image.asset(DesignAssets.LOGO),
              ),
              CupertinoActivityIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
