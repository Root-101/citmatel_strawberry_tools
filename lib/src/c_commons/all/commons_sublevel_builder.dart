import 'package:auto_size_text/auto_size_text.dart';
import 'package:citmatel_strawberry_tools/src/a_utils/strawberry_custom_app_bar.dart';
import 'package:citmatel_strawberry_tools/src/c_commons/all/commons_all_exporter.dart';
import 'package:flutter/material.dart';

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
  }) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: StrawberryCustomAppBar(
        changeOrderOfTheChilds: true,
        smallChild: Center(
          child: SizedBox(
            width: deviceSize.width / 11,
            height: deviceSize.width / 13,
            child: const BackButton(
              color: Colors.white,
            ),
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
                "#$nivel ",
                style: nivelTextStyle ??
                    TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: deviceSize.width / 20,
                    ),
                maxLines: 1,
              ),
              SizedBox(
                width: deviceSize.width / 4,
                child: AutoSizeText(
                  "$tema  ",
                  style: temaTextStyle ??
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: deviceSize.width / 16,
                      ),
                  maxLines: 1,
                ),
              ),
              CommonsStarsIndicator(
                stars: stars,
                maxStars: maxStar,
                normalSize: deviceSize.width / 14,
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
