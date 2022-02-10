import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StrawberryLevelLose extends StatefulWidget {
  static const ROUTE_NAME = "/tools-loose-level-screen";

  late Widget _childFirstText = StrawberryAnimatedTextKit.rotateAnimatedText(
    repeatForever: true,
    texts: ['Has perdido.', 'Inténtalo de nuevo.', 'El que persevera triunfa.'],
  );

  final Function()? leftButtonFunction;
  final Function()? rightButtonFunction;

  StrawberryLevelLose({
    Key? key,
    Widget? childFirstText,
    this.leftButtonFunction,
    this.rightButtonFunction,
    ImageProvider? backgroundImage,
  }) : super(key: key) {
    if (childFirstText != null) {
      _childFirstText = childFirstText;
    }
  }

  @override
  State<StrawberryLevelLose> createState() => _StrawberryLevelLoseState();
}

class _StrawberryLevelLoseState extends State<StrawberryLevelLose>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: StrawberryWidgets.animateRainBackground(
          vsync: this,
          child: SafeArea(
            child: Stack(
              children: [
                _buildCharacter(deviceSize),
                _buildAnimatedText(deviceSize),
                _buildLeftButton(),
                _buildRightButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildAnimatedText(Size deviceSize) {
    return Positioned(
      top: deviceSize.height / 3,
      left: 0.0,
      right: 0.0,
      child: StrawberryAnimatedTextKit.rotateAnimatedText(
        repeatForever: true,
        texts: [
          'Has perdido.',
          'Inténtalo de nuevo.',
          'El que persevera triunfa.'
        ],
        fontSize: deviceSize.width / 10,
      ),
    );
  }

  _buildCharacter(Size deviceSize) {
    double height = deviceSize.height / 3;
    return Positioned(
      bottom: deviceSize.height / 15,
      left: 0.0,
      right: 0.0,
      child: Container(
        alignment: Alignment.topCenter,
        height: height,
        width: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ToolsAssetsSadBrain.randomSadBrain()),
          ),
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
          child: StrawberryWidgets.rotateIconAnimation(),
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
