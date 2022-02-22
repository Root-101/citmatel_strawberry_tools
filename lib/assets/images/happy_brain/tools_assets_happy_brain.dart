import 'dart:math';

import 'package:citmatel_strawberry_tools/assets/tools_assets.dart';

class ToolsAssetsHappyBrain {
  static final Random _random = Random();

  static randomHappyBrain() {
    return imagesHappyBrain[_random.nextInt(imagesHappyBrain.length)];
  }

  static const imagesHappyBrain = <String>[
    '${ToolsAssets.images}/happy_brain/happy_1.png',
    '${ToolsAssets.images}/happy_brain/happy_2.png',
    '${ToolsAssets.images}/happy_brain/happy_3.png',
  ];
}
