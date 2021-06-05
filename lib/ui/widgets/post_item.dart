import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:workshop_souenergy_flutter/shared/design/design_assets.dart';
import 'package:workshop_souenergy_flutter/shared/design/design_colors.dart';

class PostItemWidget extends StatelessWidget {
  final double? width;
  final String? userId;
  final String userName;
  final String postDescription;
  final String? imageAvatarUrl;
  final String? owner;
  final Function? onOptionsTap;
  PostItemWidget(
      {Key? key,
      required this.width,
      this.imageAvatarUrl,
      this.userName = '',
      this.postDescription = '',
      this.owner = '',
      required this.onOptionsTap,
      this.userId})
      : super(key: key);

  final GetStorage _box = GetStorage();

  bool checkOfLoggedUser(String? userId) {
    var localUserId = _box.read("userId");
    if (localUserId != userId) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: CachedNetworkImage(
                  imageUrl: imageAvatarUrl!,
                  placeholder: (context, url) => CircularProgressIndicator(
                    backgroundColor: DesignColors.COLOR_LIGHT_GREY,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: DesignColors.COLOR_ORANGE,
                      fontSize: 14,
                      fontWeight: FontWeight.w800),
                ),
                Container(
                  width: width,
                  child: Text(
                    postDescription,
                    style: TextStyle(fontWeight: FontWeight.w400),
                    maxLines: 30,
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: 1.4,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    owner!,
                    textScaleFactor: 1.2,
                    style: TextStyle(
                        color: DesignColors.COLOR_LIGHT_GREY,
                        fontSize: 9,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: checkOfLoggedUser(userId!)
                ? InkWell(
                    onTap: () => onOptionsTap,
                    radius: 100,
                    child: Icon(
                      CupertinoIcons.ellipsis_vertical,
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}
