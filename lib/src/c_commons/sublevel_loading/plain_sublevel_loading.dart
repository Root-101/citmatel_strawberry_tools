import 'dart:async';

import 'package:citmatel_strawberry_tools/src/a_utils/strawberry_animated_text_kit.dart';
import 'package:citmatel_strawberry_tools/src/a_utils/strawberry_loading_spinkit.dart';
import 'package:flutter/material.dart';

class PlainSubLevelLoading extends StatefulWidget {
  static const Duration DEFAULT_DURATION = Duration(seconds: 3);
  // final String backgroundURL;
  final List<String> firstText;
  final List<String> secondText;
  final Widget subLevel;
  final Duration duration;
  final Color firstColor;
  final Color secondColor;

  const PlainSubLevelLoading({
//    required this.backgroundURL,
    required this.firstText,
    this.secondText = const [''],
    required this.subLevel,
    this.firstColor = Colors.red,
    this.secondColor = Colors.blue,
    this.duration = DEFAULT_DURATION,
    Key? key,
  }) : super(key: key);

  @override
  _PlainSubLevelLoadingState createState() => _PlainSubLevelLoadingState();
}

class _PlainSubLevelLoadingState extends State<PlainSubLevelLoading> {
  late Widget _animatedWidget;

  Timer? timer;

  @override
  void initState() {
    _animatedWidget = Container(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StrawberryAnimatedTextKit.typewriterAnimatedText(
            texts: widget.firstText,
            color: Colors.white,
            repeatForever: true,
          ),
          StrawberryAnimatedTextKit.typewriterAnimatedText(
            texts: widget.secondText,
            color: Colors.white,
            repeatForever: true,
          ),
          SizedBox(
            height: 350,
            width: 350,
            child: StrawberryLoadingSpinkit.randomLoadingSpinkit(),
          ),
          //a random loading every time
        ],
      ),
    );
    timer = Timer(Duration(seconds: widget.duration.inSeconds), () {
      setState(() {
        _animatedWidget = widget.subLevel;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            widget.firstColor,
            widget.secondColor,
          ],
        ),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        child: _animatedWidget,
      ),
    );
  }
}
