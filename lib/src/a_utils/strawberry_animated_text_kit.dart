import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class StrawberryAnimatedTextKit {
  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static Widget congratsAnimatedText() {
    return AnimatedTextKit(
      animatedTexts: [
        ColorizeAnimatedText(
          'Felicidades',
          textStyle: const TextStyle(
            fontSize: 70.0,
            fontFamily: 'Horizon',
          ),
          colors: colorizeColors,
        ),
      ],
      repeatForever: true,
    );
  }

  static Widget congratsLongAnimatedText() {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 50.0,
        color: Colors.blueAccent,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          RotateAnimatedText('Has Ganado'),
          RotateAnimatedText('Lo Lograste'),
          RotateAnimatedText('Eres el Mejor'),
        ],
        repeatForever: true,
      ),
    );
  }
}
