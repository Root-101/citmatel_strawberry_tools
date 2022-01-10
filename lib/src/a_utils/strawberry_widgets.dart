import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class StrawberryWidgets {
  static Widget animateBackground(
      {Color baseColor = Colors.blueAccent,
      Image? image,
      required TickerProvider vsync,
      required Widget child}) {
    return AnimatedBackground(
      behaviour: RandomParticleBehaviour(
        options: ParticleOptions(
          baseColor: baseColor,
          image: image,
        ),
      ),
      vsync: vsync,
      child: child,
    );
  }
}
