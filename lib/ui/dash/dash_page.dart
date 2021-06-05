import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workshop_souenergy_flutter/shared/design/design_colors.dart';
import 'package:workshop_souenergy_flutter/ui/dash/dash_controller.dart';
import 'package:workshop_souenergy_flutter/ui/feed/feed_page.dart';
import 'package:workshop_souenergy_flutter/ui/profile/profile_page.dart';

class DashPage extends GetView<DashController> {
  final List<Widget> bodyContent = [
    FeedPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Center(
          child: bodyContent.elementAt(controller.selectedIndex),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          child: BottomNavigationBar(
            backgroundColor: DesignColors.COLOR_BACKGROUND,
            selectedItemColor: DesignColors.COLOR_ORANGE,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bubble_middle_bottom),
                label: "Feed",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.profile_circled),
                label: "Perfil",
              ),
            ],
            currentIndex: controller.selectedIndex,
            onTap: (index) => controller.selectedIndex = index,
          ),
        ),
      ),
    );
  }
}
