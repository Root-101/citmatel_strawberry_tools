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

  static const String THEME_GENERAL = "$_assets/1_cultura_general.png";
  static const String THEME_GENERAL_NAME = "General";
  static final ToolsThemesBackgroundImage THEME_CULTURA_GENERAL_BACKGROUND =
      ToolsThemesBackgroundImage(
    urlImage: ToolsThemesAssets.THEME_GENERAL,
    colorStrong: const Color(0xffd4801c),
    colorLight: const Color(0xffe1a41b).withOpacity(0.5),
  );

  static const String THEME_CIENCIAS = "$_assets/2_ciencias.png";
  static const String THEME_CIENCIAS_NAME = "Ciencias";
  static final ToolsThemesBackgroundImage THEME_CIENCIAS_BACKGROUND =
      ToolsThemesBackgroundImage(
    urlImage: ToolsThemesAssets.THEME_CIENCIAS,
    colorStrong: const Color(0xff3b4c96),
    colorLight: const Color(0xff3fd4fc).withOpacity(0.5),
  );

  static const String THEME_TECNOLOGIA = "$_assets/3_tecnologia.png";
  static const String THEME_TECNOLOGIA_NAME = "Tecnologías";
  static final ToolsThemesBackgroundImage THEME_TECNOLOGIA_BACKGROUND =
      ToolsThemesBackgroundImage(
    urlImage: ToolsThemesAssets.THEME_TECNOLOGIA,
    colorStrong: const Color(0xff5a73a6),
    colorLight: const Color(0xffa9b5d5).withOpacity(0.5),
  );

  static const String THEME_MITOLOGIA = "$_assets/4_mitology.png";
  static const String THEME_MITOLOGIA_NAME = "Mitología";
  static final ToolsThemesBackgroundImage THEME_MITOLOGIA_BACKGROUND =
      ToolsThemesBackgroundImage(
    urlImage: ToolsThemesAssets.THEME_MITOLOGIA,
    colorStrong: const Color(0xff744e6c),
    colorLight: const Color(0xff896683).withOpacity(0.5),
  );

  static const String THEME_GEOGRAFIA = "$_assets/6_geografia.png";
  static const String THEME_GEOGRAFIA_NAME = "Geografía";
  static final ToolsThemesBackgroundImage THEME_GEOGRAFIA_BACKGROUND =
      ToolsThemesBackgroundImage(
    urlImage: ToolsThemesAssets.THEME_GEOGRAFIA,
    colorStrong: const Color(0xff4e6f4d),
    colorLight: const Color(0xff896683).withOpacity(0.5),
  );

  static const String THEME_ARTE = "$_assets/8_arte.png";
  static const String THEME_ARTE_NAME = "Arte";
  static final ToolsThemesBackgroundImage THEME_ARTE_BACKGROUND =
      ToolsThemesBackgroundImage(
    urlImage: ToolsThemesAssets.THEME_ARTE,
    colorStrong: const Color(0xff654a3c),
    colorLight: const Color(0xff9a725d).withOpacity(0.5),
  );

  static const String THEME_HISTORIA = "$_assets/7_historia.png";
  static const String THEME_HISTORIA_NAME = "Historia";
  static final ToolsThemesBackgroundImage THEME_HISTORIA_BACKGROUND =
      ToolsThemesBackgroundImage(
    urlImage: ToolsThemesAssets.THEME_HISTORIA,
    colorStrong: const Color(0xff7f3588),
    colorLight: const Color(0xffb079ac).withOpacity(0.5),
  );

  static const String THEME_DEPORTE = "$_assets/5_deporte.png";
  static const String THEME_DEPORTE_NAME = "Deporte";
  static final ToolsThemesBackgroundImage THEME_DEPORTE_BACKGROUND =
      ToolsThemesBackgroundImage(
    urlImage: ToolsThemesAssets.THEME_DEPORTE,
    colorStrong: const Color(0xffc35735),
    colorLight: const Color(0xffbd9c97).withOpacity(0.5),
  );

  static const String THEME_ANIMALES = "$_assets/9_animales.png";
  static const String THEME_ANIMALES_NAME = "Animales";
  static final ToolsThemesBackgroundImage THEME_ANIMALES_BACKGROUND =
      ToolsThemesBackgroundImage(
    urlImage: ToolsThemesAssets.THEME_ANIMALES,
    colorStrong: const Color(0xff004221),
    colorLight: const Color(0xff547e68).withOpacity(0.5),
  );
}
