import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// ignore: must_be_immutable
class StrawberryLevelWin extends StatefulWidget {
  static const ROUTE_NAME = "/tools-win-level-screen";

  late Widget _childFirstText = StrawberryAnimatedTextKit.colorizeAnimatedText(
    text: 'Felicidades',
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
      floatingActionButton: StrawberryWidgets.circularButtonWithIcon(
        onPressed: widget.rightButtonFunction,
        child: StrawberryWidgets.pulseIconAnimation(
          icon: Icons.home_sharp,
        ),
      ),
      body: Container(
        decoration:  BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: widget._backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: StrawberryWidgets.animateBackground(
          vsync: this,
          child: StrawberryWidgets.animateBackground(
            vsync: this,
            baseColor: Colors.red,
            child: Stack(
              children: [
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    widget._childFirstText,
                    widget._childSecondText,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
