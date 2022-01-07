import 'package:animated_background/animated_background.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';

class StrawberryLevelLose extends StatefulWidget {
  static const ROUTE_NAME = "/tools-loose-level-screen";

  const StrawberryLevelLose({Key? key}) : super(key: key);

  @override
  State<StrawberryLevelLose> createState() => _StrawberryLevelLoseState();
}

class _StrawberryLevelLoseState extends State<StrawberryLevelLose>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            baseColor: Colors.blueAccent,
            image: Image.asset(ToolsAssets.ICON_BABY_BOY),
          ),
        ),
        vsync: this,
        child: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
              baseColor: Colors.red,
              image: Image.asset(ToolsAssets.ICON_BABY_GIRL),
            ),
          ),
          vsync: this,
          child: Container(
            alignment: Alignment.center,
            child: SizedBox(
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Agne',
                    color: Colors.blueAccent),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Has perdido.'),
                    TypewriterAnimatedText('Inténtalo de nuevo.'),
                    TypewriterAnimatedText('El que persevera triunfa.'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
