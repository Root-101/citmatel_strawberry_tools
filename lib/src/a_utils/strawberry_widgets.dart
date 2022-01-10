import 'package:animated_background/animated_background.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class StrawberryWidgets {
  // Widgets comuns in StrawberrysProjects

  // Makes the backgroun animated, like confetti but with another forms.
  static Widget animateBackground(
      {Color baseColor = Colors.blueAccent,
      Image? image,
      required TickerProvider vsync,
      required Widget child}) {
    return AnimatedBackground(
      behaviour: RandomParticleBehaviour(
        options: ParticleOptions(
          // Color of the paticles.
          baseColor: baseColor,
          // The particle instead of been a circle can have an image.
          image: image,
        ),
      ),
      // So the particles can move arround the screen.
      vsync: vsync,
      // The widget tree above the background particle.
      child: child,
    );
  }

  //Makes cofetti.
  static Widget confettiWidget({
    required ConfettiController confettiController,
    List<MaterialColor> listOfColors = StrawberryConstants.listOfColors,
  }) {
    return ConfettiWidget(
      confettiController: confettiController,
      blastDirectionality: BlastDirectionality.explosive,
      // Configure the drag force to apply to the confetti.
      particleDrag: 0.05,
      // The higher the value the higher the likelihood that particles will be emitted on a single frame.
      emissionFrequency: 0.5,
      // The number of particles to be emitted per emission.
      numberOfParticles: 100,
      // Change the speed at which the confetti falls.
      gravity: 0.5,
      // Size of the confetti.
      minimumSize: const Size(5, 5),
      maximumSize: const Size(10, 10),
      shouldLoop: false,
      // List of all the colors that the confetti can have.
      colors: listOfColors,
    );
  }
}
