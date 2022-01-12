import 'dart:math';

import 'package:citmatel_strawberry_tools/assets/tools_assets.dart';

class ToolsAssetsTrofie {
  static final Random _random = Random();

  static randomTrofie() {
    return imagesTrofie[_random.nextInt(imagesTrofie.length)];
  }

  static const imagesTrofie = <String>[
    '${ToolsAssets.images}/trofie/cup_1.png',
    '${ToolsAssets.images}/trofie/cup_2.png',
    '${ToolsAssets.images}/trofie/cup_3.png',
    '${ToolsAssets.images}/trofie/cup_4.png',
    '${ToolsAssets.images}/trofie/cup_5.png',
    '${ToolsAssets.images}/trofie/cup_6.png',
    '${ToolsAssets.images}/trofie/cup_7.png',
    '${ToolsAssets.images}/trofie/cup_8.png',
  ];
}
