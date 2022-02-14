import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

// ignore: must_be_immutable
class StrawberryLevelWin extends StatefulWidget {
  static const ROUTE_NAME = "/tools-win-level-screen";

  late List<String> _childFirstText = [
    'Felicidades',
    'Has Ganado',
    'Lo Lograste',
    'Eres lo Mejor'
  ];

  final Function()? leftButtonFunction;
  final Function()? rightButtonFunction;

  final int stars;
  final int maxStar;

  StrawberryLevelWin({
    Key? key,
    List<String>? childFirstText,
    this.leftButtonFunction,
    this.rightButtonFunction,
    ImageProvider? backgroundImage,
    required this.stars,
    required this.maxStar,
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
  final double proportion = 4.2;

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
                  _buildStars(
                    stars: widget.stars,
                    maxStar: widget.maxStar,
                    deviceSize: deviceSize,
                  ),
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

  _buildAnimatedText(Size deviceSize, List<String> text) {
    return Positioned(
      top: deviceSize.height / 2 - 180,
      left: 0.0,
      right: 0.0,
      child: StrawberryAnimatedTextKit.rotateAnimatedText(
        texts: widget._childFirstText,
        repeatForever: true,
        fontSize: deviceSize.width / 6,
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

  _buildStars({
    required int stars,
    required int maxStar,
    required deviceSize,
  }) {
    return Positioned(
      top: deviceSize.height / 2 - 30,
      left: 0.0,
      right: 0.0,
      child: Center(
        child: CommonsStarsIndicator(
          stars: stars,
          maxStars: maxStar,
          normalSize: deviceSize.width / 7,
          bigSize: deviceSize.width / 4,
        ),
      ),
    );
  }
}
