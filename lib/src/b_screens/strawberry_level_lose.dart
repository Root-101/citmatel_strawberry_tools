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
      floatingActionButton: StrawberryWidgets.circularButtonWithIcon(
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
          icon: Icons.home_sharp,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: widget._backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: StrawberryWidgets.animateBackground(
          vsync: this,
          image: Image.asset(ToolsAssets.ICON_BABY_BOY),
          child: StrawberryWidgets.animateBackground(
            vsync: this,
            baseColor: Colors.red,
            image: Image.asset(ToolsAssets.ICON_BABY_GIRL),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(15),
                  child: StrawberryWidgets.circularButtonWithIcon(
                    onPressed: widget.leftButtonFunction,
                    child: StrawberryWidgets.rotateIconAnimation(),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: widget._childFirstText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
