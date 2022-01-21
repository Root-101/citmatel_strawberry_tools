import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class StrawberryTutorial {
  // Add a custom target to the list of targets in the tutorial.
  static TargetFocus addTarget({
    required dynamic identify,
    required GlobalKey<State<StatefulWidget>>? keyTarget,
    Color? shadowColor,
    Color textColor = Colors.white,
    ContentAlign contentAlign = ContentAlign.bottom,
    CrossAxisAlignment textCrossAxisAlignment = CrossAxisAlignment.center,
    String title = '',
    String description = '',
    ShapeLightFocus shape = ShapeLightFocus.RRect,
  }) {
    return TargetFocus(
      // The identifyer of the target.
      identify: identify,
      // The key of the widget that is been target on.
      keyTarget: keyTarget,
      // The color of the backgground shadow.
      color: shadowColor,
      // The contents in the background.
      contents: [
        TargetContent(
          // The aligment of the target content.
          align: contentAlign,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: textCrossAxisAlignment,
              children: <Widget>[
                Text(
                  // This are the title settings.
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      fontSize: 20.0),
                ),
                // This are the description settings.
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    description,
                    style: TextStyle(color: textColor),
                  ),
                )
              ],
            ),
          ),
        )
      ],
      // The shape of the target focus.
      shape: shape,
      radius: 5,
    );
  }

  // To start the tutorial.
  static TutorialCoachMark showTutorial({
    required BuildContext context,
    required List<TargetFocus> targets,
    Color colorShadow = Colors.black,
    String textSkip = "Saltar",
    Function()? onFinish,
    Function()? onSkip,
    FutureOr<void> Function(TargetFocus)? onClickTarget,
    FutureOr<void> Function(TargetFocus)? onClickOverlay,
  }) {
    return TutorialCoachMark(
        // The context in wich the tutirial is going to show.
        context,
        // The list with the tutorial targets.
        targets: targets,
        // The background shadow color.
        colorShadow: colorShadow,
        // The text in the skip button.
        textSkip: textSkip,
        // The padding to the target focus.
        paddingFocus: 10,
        // The opacity in the shadow.
        opacityShadow: 0.8,
        // What happends when the tutorial finish.
        onFinish: onFinish,
        // What happends when a target is pressed.
        onClickTarget: onClickTarget,
        // What happends when the skip button is pressed.
        onSkip: onSkip,
        // What happends when the overlay is pressed.
        onClickOverlay: onClickOverlay)
      // And finally show the TutorialCoachMark previously initializated.
      ..show();
  }
}
