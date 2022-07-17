import 'package:citmatel_strawberry_tools/assets/assets_exporter.dart';
import 'package:flutter/material.dart';

class ToolsThemesAssets {
  static const _assets =
      "packages/citmatel_strawberry_tools/assets/images/themes";

  ////IMAGES////

  static const String THEME_TUTORIAL = "$_assets/0_tutorial.png";
  static const String THEME_TUTORIAL_NAME = "Tutorial";
  static final ToolsThemesBackgroundImage THEME_TUTORIAL_BACKGROUND =
      ToolsThemesBackgroundImage(
    urlImage: ToolsThemesAssets.THEME_TUTORIAL,
    colorStrong: const Color(0xff960b3c),
    colorLight: const Color(0xffca1a41).withOpacity(0.5),
  );
}
