import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workshop_souenergy_flutter/shared/design/design_assets.dart';
import 'package:workshop_souenergy_flutter/shared/design/design_colors.dart';
import 'package:workshop_souenergy_flutter/ui/profile/profile_controller.dart';
import 'package:workshop_souenergy_flutter/ui/widgets/app_bar_widget.dart';
import 'package:workshop_souenergy_flutter/ui/widgets/saction_button.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColors.COLOR_BACKGROUND,
      appBar: AppBarWidget(
        title: "Meu Perfil",
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                controller.logOut();
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: DesignAssets.PROFILE_IMG,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        backgroundColor: DesignColors.COLOR_LIGHT_GREY,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  controller.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: DesignColors.COLOR_ORANGE,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SectionButtonWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
