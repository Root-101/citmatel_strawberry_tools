import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';

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
      body: StrawberryWidgets.animateBackground(
        vsync: this,
        child: StrawberryWidgets.animateBackground(
          vsync: this,
          baseColor: Colors.red,
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
