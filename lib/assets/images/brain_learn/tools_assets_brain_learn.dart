import 'dart:math';

import 'package:citmatel_strawberry_tools/assets/tools_assets.dart';

class ToolsAssetsBrainLearn {
  static final Random _random = Random();

  static randomBrainLearn() {
    return imagesBrainLearn[_random.nextInt(imagesBrainLearn.length)];
  }

  static const imagesBrainLearn = <String>[
    '${ToolsAssets.images}/brain_learn/brain_book.png',
    '${ToolsAssets.images}/brain_learn/brain_light.png',
    '${ToolsAssets.images}/brain_learn/brain_lupa.png',
    '${ToolsAssets.images}/brain_learn/brain_ommm.png',
    '${ToolsAssets.images}/brain_learn/brain_question.png',
  ];
}
