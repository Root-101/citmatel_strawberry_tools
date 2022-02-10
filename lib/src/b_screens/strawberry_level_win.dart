import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

// ignore: must_be_immutable
class StrawberryLevelWin extends StatefulWidget {
  static const ROUTE_NAME = "/tools-win-level-screen";

  late String _childFirstText = 'Felicidades';

  final Function()? leftButtonFunction;
  final Function()? rightButtonFunction;

  StrawberryLevelWin({
    Key? key,
    String? childFirstText,
    this.leftButtonFunction,
    this.rightButtonFunction,
    ImageProvider? backgroundImage,
  }) : super(key: key) {
    if (childFirstText != null) {
      _childFirstText = childFirstText;
    }
  }

  @override
  State<StrawberryLevelWin> createState() => _StrawberryLevelWinState();
}

class _StrawberryLevelWinState extends State<StrawberryLevelWin>
    with TickerProviderStateMixin {
  final double proportion = 5.0;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        // The background color.
        color: Colors.black,
        //// THE ANIMATED BACKGROUND ////
        child: StrawberryWidgets.animateBackground(
          vsync: this,
          child: StrawberryWidgets.animateBackground(
            vsync: this,
            baseColor: Colors.red,
            child: SafeArea(
              child: Stack(
                children: [
                  _buildTrophy(deviceSize),
                  _buildCharacter(deviceSize),
                  _buildAnimatedText(deviceSize, widget._childFirstText),
                  _buildLeftButton(),
                  _buildRightButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildTrophy(Size deviceSize) {
    double height = deviceSize.height / proportion;

    return Positioned(
      top: deviceSize.height / 19,
      left: 0.0,
      right: 0.0,
      child: Tada(
        preferences:
            const AnimationPreferences(autoPlay: AnimationPlayStates.Loop),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: height,
          width: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ToolsAssetsTrofie.randomTrofie(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildCharacter(Size deviceSize) {
    double height = deviceSize.height / proportion;
    return Positioned(
      bottom: deviceSize.height / 15,
      left: 0.0,
      right: 0.0,
      child: Bounce(
        preferences:
            const AnimationPreferences(autoPlay: AnimationPlayStates.Loop),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: height,
          width: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ToolsAssetsHappyBrain.randomHappyBrain(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildAnimatedText(Size deviceSize, String text) {
    return Positioned(
      top: deviceSize.height / 2 - 150,
      left: 0.0,
      right: 0.0,
      child: FittedBox(
        child: StrawberryAnimatedTextKit.colorizeAnimatedText(
          text: 'Felicidades',
          repeatForever: true,
        ),
      ),
    );
  }

  _buildLeftButton() {
    return Positioned(
      left: 10.0,
      bottom: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StrawberryWidgets.circularButtonWithIcon(
          heroTag: 'leftButton',
          onPressed: widget.leftButtonFunction,
          child: StrawberryWidgets.heartBeatIconAnimation(
            icon: Icons.next_plan_outlined,
          ),
        ),
      ),
    );
  }

  _buildRightButton() {
    return Positioned(
      bottom: 10.0,
      right: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StrawberryWidgets.circularButtonWithIcon(
          heroTag: 'rightButton',
          // The function to display when the rigth button is pressed.
          onPressed: widget.rightButtonFunction,
          child: StrawberryWidgets.pulseIconAnimation(
            // The icon of the button with an animation.
            icon: Icons.home_sharp,
          ),
        ),
      ),
    );
  }
}
