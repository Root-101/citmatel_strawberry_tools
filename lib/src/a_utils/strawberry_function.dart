import 'dart:async';

import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StrawberryFunction {
  static Timer? _timer;

  static dispose() {
    _timer?.cancel();
  }

  // This show a screen that tell to user it lost.
  static void looseLevel({
    Transition transition = Transition.zoom,
    Duration duration = const Duration(milliseconds: 500),
    Duration timeBeforeTheTransition = const Duration(seconds: 2),
    Function()? leftButtonFunction,
    Function()? rightButtonFunction,
    List<String>? childFirstText,
    ImageProvider? backgroundImage,
    required int stars,
    required int maxStar,
    required bool mute,
  }) async {
    StrawberryAudio.playAudioLose(mute);
    // Time before push one page above other.
    _timer = Timer(
      timeBeforeTheTransition,
      () {
        Get.off(
          // Go to a determinated page.
          StrawberryLevelLose(
            // The list of texts an is animation that the screen is going to show.
            childFirstText: childFirstText,
            // The Function that is going to be executed when the left button is pressed.
            leftButtonFunction: leftButtonFunction,
            // The Function that is going to be executed when the right button is pressed.
            rightButtonFunction: rightButtonFunction,
            // The image thas is going to go in the background.
            backgroundImage: backgroundImage,
            maxStar: maxStar,
            stars: stars,
          ),
          // The transition of one page to another.
          transition: transition,
          // The duration of the transition.
          duration: duration,
        );
      },
    );
  }

  // This show a screen that tell to user it win.
  static void winLevel({
    Transition transition = Transition.zoom,
    Duration duration = const Duration(milliseconds: 500),
    Duration timeBeforeTheTransition = const Duration(seconds: 2),
    Function()? leftButtonFunction,
    Function()? rightButtonFunction,
    List<String>? childFirstText,
    ImageProvider? backgroundImage,
    required int stars,
    required int maxStar,
    required bool mute,
  }) async {
    StrawberryAudio.playAudioWin(mute);
    // Time before push one page above other.
    _timer = Timer(
      timeBeforeTheTransition,
      () {
        StrawberryVibration.vibrateWithWinPattern();
        Get.off(
          // Go to a determinated page.
          StrawberryLevelWin(
            // The first list of texts an is animation that the screen is going to show.
            childFirstText: childFirstText,
            // The Function that is going to be executed when the left button is pressed.
            leftButtonFunction: leftButtonFunction,
            // The Function that is going to be executed when the right button is pressed.
            rightButtonFunction: rightButtonFunction,
            // The image thas is going to go in the background.
            backgroundImage: backgroundImage,
            maxStar: maxStar,
            stars: stars,
          ),
          // The transition of one page to another.
          transition: transition,
          // The duration of the transition.
          duration: duration,
        );
      },
    );
  }
}
