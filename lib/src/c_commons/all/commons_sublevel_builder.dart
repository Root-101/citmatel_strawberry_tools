import 'package:auto_size_text/auto_size_text.dart';
import 'package:citmatel_strawberry_tools/src/a_utils/strawberry_custom_app_bar.dart';
import 'package:citmatel_strawberry_tools/src/c_commons/all/commons_all_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonsSubLevelBuilder {
  static Scaffold buildScaffold({
    required int nivel,
    required String tema,
    required Size deviceSize,
    TextStyle? nivelTextStyle,
    TextStyle? temaTextStyle,
    int stars = 1,
    int maxStar = 3,
    Widget? body,
    GlobalKey? starsKey,
    GlobalKey? levelKey,
    GlobalKey? themeKey,
    GlobalKey? backKey,
  }) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: StrawberryCustomAppBar(
        changeOrderOfTheChilds: true,
        smallChild: Center(
          child: IconButton(
            padding: EdgeInsets.zero,
            alignment: Alignment.center,
            key: backKey,
            icon: const Icon(Icons.arrow_back_rounded),
            color: Colors.white,
            onPressed: () => Get.back(),
          ),
        ),
        largeChild: SizedBox(
          width: deviceSize.width / 1,
          height: deviceSize.width / 13,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AutoSizeText(
                "#$nivel",
                style: nivelTextStyle ??
                    Get.textTheme.subtitle2?.copyWith(
                      color: Colors.white,
                      fontSize: deviceSize.width / 20,
                    ),
                maxLines: 1,
                key: levelKey,
              ),
              SizedBox(
                width: deviceSize.width / 4,
                child: AutoSizeText(
                  "$tema  ",
                  style: temaTextStyle ??
                      Get.textTheme.subtitle2?.copyWith(
                        color: Colors.white,
                        fontSize: deviceSize.width / 16,
                      ),
                  maxLines: 1,
                  key: themeKey,
                ),
              ),
              CommonsStarsIndicator(
                key: starsKey,
                stars: stars,
                maxStars: maxStar,
                normalSize: deviceSize.width / 15,
                bigSize: deviceSize.width / 9,
              ),
            ],
          ),
        ),
      ),
      body: body,
    );
  }
}
