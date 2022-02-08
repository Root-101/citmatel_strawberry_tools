import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class CommonsStarsIndicator extends StatelessWidget {
  final int stars;
  final int maxStars;
  final int startMultiplier;
  final double normalSize;
  final double bigSize;
  final bool paintMiddleBigStar;

  const CommonsStarsIndicator({
    required this.stars,
    required this.maxStars,
    this.startMultiplier = 2, //por defecto dos para tener la media estrella
    this.normalSize = 30,
    this.bigSize = 50,
    this.paintMiddleBigStar = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ..._buildAllStars(),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  List<Widget> _buildAllStars() {
    int reallyFullStars = stars ~/ startMultiplier;

    int halfStar = stars % startMultiplier;

    int bigStar = maxStars ~/ 2;
    bool halfStartPainted = false;
    return List.generate(
      maxStars,
      (index) {
        double size =
            index == bigStar && paintMiddleBigStar ? bigSize : normalSize;
        if (index < reallyFullStars) {
          return _buildFullStar(size);
        } else if (halfStar == 1 && !halfStartPainted) {
          halfStartPainted = true;
          return _buildHalfStar(size);
        } else {
          return _buildEmptyStar(size);
        }
      },
    );
  }

  Widget _buildEmptyStar(double size) {
    return FaIcon(
      FontAwesomeIcons.star,
      color: Colors.yellow,
      size: size,
    );
  }

  Widget _buildHalfStar(double size) {
    return FaIcon(
      FontAwesomeIcons.starHalfAlt,
      color: Colors.yellow,
      size: size,
    );
  }

  Widget _buildFullStar(double size) {
    return FaIcon(
      FontAwesomeIcons.solidStar,
      color: Colors.yellow,
      size: size,
    );
  }
}
