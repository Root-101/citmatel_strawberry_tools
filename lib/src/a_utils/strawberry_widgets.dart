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

  // Makes the backgroun animated, like rain.
  static Widget animateRainBackground({
    required TickerProvider vsync,
    required Widget child,
    int numLines = 70,
  }) {
    return AnimatedBackground(
      behaviour: RacingLinesBehaviour(
          // The direction of the particles.
          direction: LineDirection.Ttb,
          // The number of lines in the screen.
          numLines: numLines),
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
    required Function()? onPressed,
    Color splashColor = Colors.blueGrey,
    Color backgroundColor = Colors.lightBlue,
    Widget child = const Icon(Icons.settings_backup_restore_rounded),
  }) {
    return FloatingActionButton(
      // The color of the circle.
      backgroundColor: backgroundColor,
      // The elevation of the button.
      elevation: 20,
      // Highlight elevation is the elevation of the button when tapped.
      highlightElevation: 50,
      // The color of the splash.
      splashColor: splashColor,
      // What is supouse to happend when is pressed.
      onPressed: onPressed,
      // The icon with the animation that the button is going to have.
      child: child,
    );
  }

  static Widget rotateIconAnimation({
    IconData icon = Icons.settings_backup_restore_rounded,
    Color iconColor = Colors.white,
    AnimationPlayStates autoPlay = AnimationPlayStates.Loop,
  }) {
    return RotateIn(
      preferences: AnimationPreferences(
        autoPlay: autoPlay,
      ),
      child: normalIcon(
        icon: icon,
        iconColor: iconColor,
      ),
    );
  }

  static Widget pulseIconAnimation({
    IconData icon = Icons.settings_backup_restore_rounded,
    Color iconColor = Colors.white,
    AnimationPlayStates autoPlay = AnimationPlayStates.Loop,
  }) {
    return Pulse(
      preferences: AnimationPreferences(
        autoPlay: autoPlay,
      ),
      child: normalIcon(
        icon: icon,
        iconColor: iconColor,
      ),
    );
  }

  static Widget heartBeatIconAnimation({
    IconData icon = Icons.settings_backup_restore_rounded,
    Color iconColor = Colors.white,
    AnimationPlayStates autoPlay = AnimationPlayStates.Loop,
  }) {
    return HeartBeat(
      preferences: AnimationPreferences(
        autoPlay: autoPlay,
      ),
      child: normalIcon(
        icon: icon,
        iconColor: iconColor,
      ),
    );
  }

  static Widget normalIcon({
    IconData icon = Icons.settings_backup_restore_rounded,
    Color iconColor = Colors.white,
  }) {
    return Icon(
      // The icon tha the button is going to have.
      icon,
      // The color of the icon.
      color: iconColor,
      // The size of the icon.
      size: 40,
    );
  }
}
