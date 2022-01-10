import 'package:animated_background/animated_background.dart';
import 'package:citmatel_strawberry_tools/src/a_utils/strawberry_animated_text_kit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StrawberryLevelWin extends StatefulWidget {
  static const ROUTE_NAME = "/tools-win-level-screen";

  late Widget _childFirstText =
      StrawberryAnimatedTextKit.congratsAnimatedText();
  late Widget _childSecondText =
      StrawberryAnimatedTextKit.congratsLongAnimatedText();

  StrawberryLevelWin(
      {Key? key, Widget? childFirstText, Widget? childSecondText})
      : super(key: key) {
    if (childFirstText != null) {
      _childFirstText = childFirstText;
    }
    if (childSecondText != null) {
      _childSecondText = childSecondText;
    }
  }

  @override
  State<StrawberryLevelWin> createState() => _StrawberryLevelWinState();
}

class _StrawberryLevelWinState extends State<StrawberryLevelWin>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: const ParticleOptions(
            baseColor: Colors.blueAccent,
          ),
        ),
        vsync: this,
        child: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: const ParticleOptions(
              baseColor: Colors.red,
            ),
          ),
          vsync: this,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              widget._childFirstText,
              widget._childSecondText,
            ],
          ),
        ),
      ),
    );
  }
}
