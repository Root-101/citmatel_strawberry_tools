import 'dart:async';

import 'package:citmatel_strawberry_tools/assets/assets_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    bool showImage = true,
    bool showImageOnTop = true,
    double imagePadding = 20,
  }) {
    return TargetFocus(
      // The identifyer of the target.
      identify: identify,
      // The key of the widget that is been target on.
      keyTarget: keyTarget,
      // The color of the backgground shadow.
      color: shadowColor,
      // If is true the overlay will show the next step when is pressed
      enableOverlayTab: true,
      // The contents in the background.
      contents: [
        TargetContent(
          // The aligment of the target content.
          align: contentAlign,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: textCrossAxisAlignment,
            children: <Widget>[
              showImage && showImageOnTop
                  ? buildImage(imagePadding)
                  : Container(),
              buildTitle(title, textColor),
              buildDescription(description, textColor),
              showImage && !showImageOnTop
                  ? buildImage(imagePadding)
                  : Container(),
            ],
          ),
        ),
      ],
      // The shape of the target focus.
      shape: shape,
      radius: 5,
    );
  }

  // Add a custom target to the list of targets in the tutorial.
  // This one have the text in one side and the image in another.
  // Or the title in one side and the description in another.
  static TargetFocus addMultipleTarget({
    required dynamic identify,
    required GlobalKey<State<StatefulWidget>>? keyTarget,
    Color? shadowColor,
    Color textColor = Colors.white,
    ContentAlign contentTextAlign = ContentAlign.top,
    ContentAlign contentImageAlign = ContentAlign.bottom,
    CrossAxisAlignment textCrossAxisAlignment = CrossAxisAlignment.center,
    String title = '',
    String description = '',
    ShapeLightFocus shape = ShapeLightFocus.RRect,
    double imagePadding = 20,
    bool showImage = true,
  }) {
    return TargetFocus(
      // The identifyer of the target.
      identify: identify,
      // The key of the widget that is been target on.
      keyTarget: keyTarget,
      // The color of the backgground shadow.
      color: shadowColor,
      // If is true the overlay will show the next step when is pressed
      enableOverlayTab: true,
      // The contents in the background.
      contents: [
        TargetContent(
          // The aligment of the target content.
          align: contentTextAlign,
          child: showImage
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: textCrossAxisAlignment,
                  children: <Widget>[
                    buildTitle(title, textColor),
                    buildDescription(description, textColor),
                  ],
                )
              : Center(
                  child: buildTitle(title, textColor),
                ),
        ),
        TargetContent(
          // The aligment of the target content.
          align: contentImageAlign,
          child: showImage
              ? buildImage(imagePadding)
              : buildDescription(description, textColor),
        ),
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
        opacityShadow: 0.95,
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

  // Builds ar random image of a learning brain.
  static Widget buildImage(double imagePadding) {
    return Padding(
      padding: EdgeInsets.only(bottom: imagePadding),
      child: Image(
        image: AssetImage(
          ToolsAssetsBrainLearn.randomBrainLearn(),
        ),
        width: 250,
      ),
    );
  }

  static Widget buildTitle(String title, Color textColor) {
    // This are the title settings.
    return Text(
      title,
      style: Get.theme.textTheme.subtitle1?.copyWith(color: textColor),
    );
  }

  static Widget buildDescription(String description, Color textColor) {
    // This are the description settings.
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 20,
      ),
      child: Text(
        description,
        style: Get.theme.textTheme.bodyText1?.copyWith(color: textColor),
      ),
    );
  }
}
