import 'dart:math';

import 'package:citmatel_strawberry_tools/assets/tools_assets.dart';

class ToolsAssetsSadBrain {
  static final Random _random = Random();

  static randomSadBrain() {
    return imagesSadBrain[_random.nextInt(imagesSadBrain.length)];
  }

  static const imagesSadBrain = <String>[
    '${ToolsAssets.images}/sad_brain/sad_brain.png',
  ];
}
