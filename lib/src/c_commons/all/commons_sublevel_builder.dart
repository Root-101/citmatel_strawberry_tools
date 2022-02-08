import 'package:citmatel_strawberry_tools/src/a_utils/strawberry_custom_app_bar.dart';
import 'package:citmatel_strawberry_tools/src/c_commons/all/commons_all_exporter.dart';
import 'package:flutter/material.dart';

class CommonsSubLevelBuilder {
  static Scaffold buildScaffold({
    required int nivel,
    required String tema,
    TextStyle nivelTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 20,
    ),
    TextStyle temaTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 25,
    ),
    int stars = 1,
    int maxStar = 3,
    bool halfStarExits = true,
    Widget? body,
  }) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: StrawberryCustomAppBar(
        changeOrderOfTheChilds: true,
        smallChild: const Center(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        largeChild: Row(
          children: [
            Text(
              "# $nivel",
              style: nivelTextStyle,
            ),
            Text(
              tema,
              style: temaTextStyle,
            ),
            CommonsStarsIndicator(
              stars: stars,
              maxStars: maxStar,
              halfStarExits: halfStarExits,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
      ),
      body: body,
    );
  }
}
