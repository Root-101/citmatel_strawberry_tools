import 'dart:ui';

import 'package:clean_core/clean_core.dart';

class ToolsThemesBackgroundImage
    extends BasicDomainObject<ToolsThemesBackgroundImage> {
  @override
  int id = 0;

  final String urlImage;
  final Color colorStrong;
  final Color colorLight;

  ToolsThemesBackgroundImage({
    required this.urlImage,
    required this.colorStrong,
    required this.colorLight,
  });

  @override
  ToolsThemesBackgroundImage clone() {
    return ToolsThemesBackgroundImage(
      urlImage: urlImage,
      colorStrong: Color(colorStrong.value),
      colorLight: Color(colorLight.value),
    );
  }
}
