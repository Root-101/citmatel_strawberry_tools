import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class StrawberryConfettiWidget extends StatelessWidget {
  late final ConfettiController _confettiController;

  StrawberryConfettiWidget(
      {Key? key, required ConfettiController confettiController})
      : super(key: key) {
    _confettiController = confettiController;
  }

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: _confettiController,
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
      colors: const [
        Colors.green,
        Colors.pink,
        Colors.blue,
        Colors.orange,
        Colors.purple
      ],
    );
  }
}
