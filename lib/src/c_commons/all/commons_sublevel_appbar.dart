import 'package:citmatel_strawberry_tools/src/c_commons/all/commons_all_exporter.dart';
import 'package:flutter/material.dart';

class CommonsSubLevelAppBar {
  static AppBar build({
    required title,
    required level,
    required winedStars,
    required maxStars,
    Color backgroundColor = Colors.transparent,
    double elevation = 0.0,
  }) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      title: Text("$title. Nivel $level."),
      centerTitle: true,
      actions: [
        CommonsStarsIndicator(
          stars: winedStars,
          maxStars: maxStars,
        ),
        const SizedBox(
          width: 15,
        ),
      ],
      leading: const BackButton(
        color: Colors.white,
      ),
    );
  }
}
