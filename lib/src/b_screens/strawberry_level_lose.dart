import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// ignore: must_be_immutable
class StrawberryLevelLose extends StatefulWidget {
  static const ROUTE_NAME = "/tools-loose-level-screen";

  late Widget _childFirstText = StrawberryAnimatedTextKit.rotateAnimatedText(
    texts: ['Has perdido.', 'Inténtalo de nuevo.', 'El que persevera triunfa.'],
  );

  final Function()? leftButtonFunction;
  final Function()? rightButtonFunction;

  ImageProvider _backgroundImage = MemoryImage(kTransparentImage);

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
    if (backgroundImage != null) {
      _backgroundImage = backgroundImage;
    }
  }

  @override
  State<StrawberryLevelLose> createState() => _StrawberryLevelLoseState();
}

class _StrawberryLevelLoseState extends State<StrawberryLevelLose>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //// THE RIGHT BUTTON ////
      floatingActionButton: StrawberryWidgets.circularButtonWithIcon(
        // The function to display when the rigth button is pressed.
        onPressed: widget.rightButtonFunction,
        // An example of how to use the functions of StrawberryFunction.winLevel
        // onPressed: () => StrawberryFunction.winLevel(
        //   childFirstText: StrawberryAnimatedTextKit.colorizeAnimatedText(
        //     text: 'kanhodashodhas',
        //     repeatForever: true,
        //   ),
        //   leftButtonFunction: () => StrawberryFunction.looseLevel(),
        // ),
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
          image: Image.asset(ToolsAssets.ICON_BABY_BOY),
          child: StrawberryWidgets.animateBackground(
            vsync: this,
            baseColor: Colors.red,
            image: Image.asset(ToolsAssets.ICON_BABY_GIRL),
            child: Padding(
              padding: const EdgeInsets.only(top: 130),
              child: Stack(
                children: [
                  //// THE IMAGE OF THE BRAIN ////
                  Container(
                    alignment: Alignment.topCenter,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ToolsAssetsSadBrain.randomSadBrain()),
                      ),
                    ),
                  ),
                  //// THE LEFT BUTTON ////
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(15),
                    child: StrawberryWidgets.circularButtonWithIcon(
                      onPressed: widget.leftButtonFunction,
                      child: StrawberryWidgets.rotateIconAnimation(),
                    ),
                  ),
                  //// THE ANIMATED TEXT ////
                  Container(
                    padding: const EdgeInsets.only(top: 200),
                    alignment: Alignment.center,
                    child: widget._childFirstText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
