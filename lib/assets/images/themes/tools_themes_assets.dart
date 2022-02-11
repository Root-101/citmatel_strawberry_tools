import 'package:citmatel_strawberry_tools/assets/assets_exporter.dart';
import 'package:flutter/material.dart';

class ToolsThemesAssets {
  static const _assets =
      "packages/citmatel_strawberry_tools/assets/images/themes";

  ////IMAGES////
  static const String THEME_CULTURA_GENERAL = "$_assets/cultura_general.png";
  static final ToolsThemesBackgroundImage THEME_CULTURA_GENERAL_BACKGROUND =
      ToolsThemesBackgroundImage(
    urlImage: ToolsThemesAssets.THEME_CULTURA_GENERAL,
    colorStrong: const Color(0xffd4801c),
    colorLight: const Color(0xffe1a41b).withOpacity(0.5),
  );

  static const String THEME_CIENCIAS = "$_assets/ciencias.png";
  static final ToolsThemesBackgroundImage THEME_CIENCIAS_BACKGROUND =
      ToolsThemesBackgroundImage(
    urlImage: ToolsThemesAssets.THEME_CIENCIAS,
    colorStrong: const Color(0xff3b4c96),
    colorLight: const Color(0xff3fd4fc).withOpacity(0.5),
  );

  static const String THEME_TECNOLOGIA = "$_assets/tecnologia.png";
  static final ToolsThemesBackgroundImage THEME_TECNOLOGIA_BACKGROUND =
      ToolsThemesBackgroundImage(
    urlImage: ToolsThemesAssets.THEME_TECNOLOGIA,
    colorStrong: const Color(0xff5a73a6),
    colorLight: const Color(0xffa9b5d5).withOpacity(0.5),
  );

  static const String THEME_TUTORIAL = "$_assets/tutorial.png";
  static final ToolsThemesBackgroundImage THEME_TUTORIAL_BACKGROUND =
      ToolsThemesBackgroundImage(
    urlImage: ToolsThemesAssets.THEME_TUTORIAL,
    colorStrong: const Color(0xff960b3c),
    colorLight: const Color(0xffca1a41).withOpacity(0.5),
  );

  static const String THEME_MITOLOGY = "$_assets/mitology.png";
  static final ToolsThemesBackgroundImage THEME_MITOLOGY_BACKGROUND =
      ToolsThemesBackgroundImage(
    urlImage: ToolsThemesAssets.THEME_MITOLOGY,
    colorStrong: const Color(0xff744e6c),
    colorLight: const Color(0xff896683).withOpacity(0.5),
  );

  static const String THEME_GEOGRAFIA = "$_assets/geografia.png";
  static final ToolsThemesBackgroundImage THEME_GEOGRAFIA_BACKGROUND =
      ToolsThemesBackgroundImage(
    urlImage: ToolsThemesAssets.THEME_GEOGRAFIA,
    colorStrong: const Color(0xff4e6f4d),
    colorLight: const Color(0xff896683).withOpacity(0.5),
  );

  static const String THEME_HISTORIA = "$_assets/historia.png";
}
