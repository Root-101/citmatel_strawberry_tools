import 'dart:async';

import 'package:flutter/material.dart';

class PlainSubLevelLoading extends StatefulWidget {
  static const Duration DEFAULT_DURATION = Duration(seconds: 3);
  final String backgroundURL;
  final Widget loading;
  final Widget subLevel;
  final Duration duration;

  const PlainSubLevelLoading({
    required this.backgroundURL,
    required this.loading,
    required this.subLevel,
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
    _animatedWidget = widget.loading;
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
        color: Colors.transparent, //pa si por si acaso
        image: DecorationImage(
          image: AssetImage(widget.backgroundURL),
          fit: BoxFit.cover,
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
