import 'package:animated_background/animated_background.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

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

  static Widget circularButtonWithIcon({
    required Function onPressed,
    Color iconColor = Colors.white,
    Color splashColor = Colors.blueGrey,
    Color backgrounColor = Colors.lightBlue,
    Widget child = const Icon(Icons.settings_backup_restore_rounded),
  }) {
    return FloatingActionButton(
      // The color of the circle.
      backgroundColor: backgrounColor,
      // The elevation of the button.
      elevation: 20,
      // Highlight elevation is the elevation of the button when tapped.
      highlightElevation: 50,
      // The forgroundColor property is used to change the color of a child — in this case, the icon’s color.
      foregroundColor: iconColor,
      // The color of the splash.
      splashColor: splashColor,
      // What is supouse to happend when is pressed.
      onPressed: () => onPressed,
      // The icon with the animation that the button is going to have.
      child: child,
    );
  }

 
}
