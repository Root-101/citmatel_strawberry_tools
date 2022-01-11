import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';

class StrawberryLevelLose extends StatefulWidget {
  static const ROUTE_NAME = "/tools-loose-level-screen";

  late Widget _childFirstText = StrawberryAnimatedTextKit.rotateAnimatedText(
    texts: ['Has perdido.', 'Inténtalo de nuevo.', 'El que persevera triunfa.'],
  );

  StrawberryLevelLose({
    Key? key,
    Widget? childFirstText,
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
    return Scaffold(
      floatingActionButton: StrawberryWidgets.circularButtonWithIcon(
        onPressed: () => print("object"),
        child: StrawberryWidgets.pulseIconAnimation(
          icon: Icons.home_sharp,
        ),
      ),
      body: StrawberryWidgets.animateBackground(
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
                  onPressed: () => print("object"),
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
    );
  }
}
