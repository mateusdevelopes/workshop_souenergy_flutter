import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workshop_souenergy_flutter/shared/design/design_colors.dart';
import 'package:workshop_souenergy_flutter/shared/models/inverter_model.dart';
import 'package:workshop_souenergy_flutter/ui/feed/feed_controller.dart';
import 'package:workshop_souenergy_flutter/ui/widgets/app_bar_widget.dart';
import 'package:workshop_souenergy_flutter/ui/widgets/post_item.dart';
import 'package:workshop_souenergy_flutter/ui/widgets/section_text.dart';

class FeedPage extends GetView<FeedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColors.COLOR_BACKGROUND,
      appBar: AppBarWidget(
        title: "Feed",
        actions: [
          !controller.checkPlatform()
              ? IconButton(
                  color: DesignColors.COLOR_ORANGE,
                  icon: Icon(CupertinoIcons.add),
                  onPressed: () {},
                )
              : Container()
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                child: SectionTextWidget(
                  text: 'Novas publicações',
                  fontSize: 26,
                ),
              ),
            ),
            Expanded(
              flex: 13,
              child: FutureBuilder<List<InverterModel>?>(
                future: controller.fetchAllInverters(),
                builder: (context, snapshot) {
                  // WHILE THE CALL IS BEING MADE LOADING
                  if (ConnectionState.active != null && !snapshot.hasData) {
                    // return Center(child: CircularProgressIndicator());
                    return controller.checkPlatform()
                        ? Center(child: CircularProgressIndicator())
                        : Center(child: CupertinoActivityIndicator());
                  }
                  // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
                  if (ConnectionState.done != null && snapshot.hasError) {
                    return Center(child: Text("snapshot.error"));
                  }
                  // IF IT WORKS IT GOES HERE!
                  return ListView.builder(
                    controller: controller.scrollController,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: PostItemWidget(
                          width: Get.width,
                          userId: snapshot.data?[index].brand,
                          owner: snapshot.data?[index].name,
                          postDescription: snapshot.data![index].description!,
                          userName: snapshot.data![index].name!,
                          imageAvatarUrl: snapshot.data?[index].avatar!,
                          onOptionsTap: () {},
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: controller.checkPlatform()
          ? FloatingActionButton(
              backgroundColor: DesignColors.COLOR_ORANGE,
              child: Icon(Icons.add),
              onPressed: () {},
            )
          : Container(),
    );
  }
}
