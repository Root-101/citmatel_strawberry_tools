import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:transparent_image/transparent_image.dart';

// ignore: must_be_immutable
class StrawberryLevelWin extends StatefulWidget {
  static const ROUTE_NAME = "/tools-win-level-screen";

  late Widget _childFirstText = StrawberryAnimatedTextKit.colorizeAnimatedText(
    text: ' Felicidades',
    repeatForever: true,
  );

  late Widget _childSecondText = StrawberryAnimatedTextKit.rotateAnimatedText(
      texts: ['Has Ganado', 'Lo Lograste', 'Eres el Mejor'],
      repeatForever: true);

  final Function()? leftButtonFunction;
  final Function()? rightButtonFunction;

  ImageProvider _backgroundImage = MemoryImage(kTransparentImage);

  StrawberryLevelWin({
    Key? key,
    Widget? childFirstText,
    Widget? childSecondText,
    this.leftButtonFunction,
    this.rightButtonFunction,
    ImageProvider? backgroundImage,
  }) : super(key: key) {
    if (childFirstText != null) {
      _childFirstText = childFirstText;
    }
    if (childSecondText != null) {
      _childSecondText = childSecondText;
    }
    if (backgroundImage != null) {
      _backgroundImage = backgroundImage;
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
      //// THE RIGHT BUTTON ////
      floatingActionButton: StrawberryWidgets.circularButtonWithIcon(
        // The function to display when the rigth button is pressed.
        onPressed: widget.rightButtonFunction,
        child: StrawberryWidgets.pulseIconAnimation(
          // The icon of the button with an animation.
          icon: Icons.home_sharp,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          // The background color.
          color: Colors.black,
          image: DecorationImage(
            // If it exits a background image.
            image: widget._backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        //// THE ANIMATED BACKGROUND ////
        child: StrawberryWidgets.animateBackground(
          vsync: this,
          child: StrawberryWidgets.animateBackground(
            vsync: this,
            baseColor: Colors.red,
            child: Stack(
              children: [
                //// THE IMAGE OF THE TROFIE ////
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Tada(
                    preferences: const AnimationPreferences(
                        autoPlay: AnimationPlayStates.Loop),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            ToolsAssetsTrofie.randomTrofie(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //// THE ANIMATED TEXT ////
                Padding(
                  padding: const EdgeInsets.only(top: 180),
                  child: Stack(
                    children: [
                      widget._childFirstText,
                      Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: widget._childSecondText,
                      ),
                    ],
                  ),
                ),
                //// THE IMAGE OF THE BRAIN ////
                Padding(
                  padding: const EdgeInsets.only(top: 490, left: 25),
                  child: Bounce(
                    preferences: const AnimationPreferences(
                        autoPlay: AnimationPlayStates.Loop),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            ToolsAssetsHappyBrain.randomHappyBrain(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //// THE LEFT BUTTON ////
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(15),
                  child: StrawberryWidgets.circularButtonWithIcon(
                    onPressed: widget.leftButtonFunction,
                    child: StrawberryWidgets.heartBeatIconAnimation(
                      icon: Icons.next_plan_outlined,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
