import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:citmatel_strawberry_tools/src/a_utils/utils_exporter.dart';
import 'package:flutter/material.dart';

class StrawberryAnimatedTextKit {
  static Widget colorizeAnimatedText({
    required String text,
    double fontSize = 70.0,
    List<MaterialColor> listOfColors = StrawberryConstants.listOfColors,
    bool repeatForever = false,
    TextAlign textAlign = TextAlign.center,
  }) {
    return AnimatedTextKit(
      animatedTexts: [
        // The effect for the AnimatedTextKit is going to be ColorizeAnimatedText.
        ColorizeAnimatedText(
          // The text to show.
          text,
          textStyle: TextStyle(
            // The size of the font.
            fontSize: fontSize,
          ),
          // To align the text to the center.
          textAlign: textAlign,
          // The list of colors to change between.
          colors: listOfColors,
        ),
      ],
      // Repeat the text rotate effect forever true or false.
      repeatForever: true,
    );
  }

  static Widget rotateAnimatedText({
    required List<String> texts,
    double fontSize = 50.0,
    Color color = Colors.blueAccent,
    bool repeatForever = false,
    TextAlign textAlign = TextAlign.center,
  }) {
    return DefaultTextStyle(
      style: TextStyle(
        // The size of the font.
        fontSize: fontSize,
        // The color of the font
        color: color,
      ),
      child: AnimatedTextKit(
        // Generates as meny RotateAnimatedText as are in the texts list.
        animatedTexts: List.generate(
          // Amount of items in the text list.
          texts.length,
          // The effect for the AnimatedTextKit is going to be RotateAnimatedText.
          (index) => RotateAnimatedText(
            // The text to show.
            texts[index],
            // To align the text to the center.
            textAlign: textAlign,
          ),
        ),
        // Repeat the text rotate effect forever true or false.
        repeatForever: repeatForever,
      ),
    );
  }
}
