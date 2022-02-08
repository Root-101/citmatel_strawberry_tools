import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class CommonsStarsIndicator extends StatelessWidget {
  final int maxStars;
  final int stars;
  final bool halfStarExits;
  final double normalSize;
  final double bigSize;
  final int bigStarIndex;
  bool _halfStarIsPainted = false;

  CommonsStarsIndicator({
    required this.stars,
    required this.maxStars,
    this.halfStarExits = false,
    this.normalSize = 30,
    this.bigSize = 50,
    this.bigStarIndex = 2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ..._buildAllStars(),
    ]);
  }

  List<Widget> _buildAllStars() {
    return List.generate(maxStars, (index) {
      if (index < stars) {
        return _buildFullStar(bigStarIndex - 1 == index ? bigSize : normalSize);
      }
      if (halfStarExits && !_halfStarIsPainted) {
        _halfStarIsPainted = true;
        return _buildHalfStar(bigStarIndex - 1 == index ? bigSize : normalSize);
      }
      return _buildEmptyStar(bigStarIndex - 1 == index ? bigSize : normalSize);
    });
  }

  Widget _buildEmptyStar(double size) {
    return FaIcon(
      FontAwesomeIcons.star,
      color: Colors.yellow,
      size: size,
    );
  }

  Widget _buildHalfStar(double size) {
    return halfStarExits
        ? FaIcon(
            FontAwesomeIcons.starHalfAlt,
            color: Colors.yellow,
            size: size,
          )
        : const SizedBox();
  }

  Widget _buildFullStar(double size) {
    return FaIcon(
      FontAwesomeIcons.solidStar,
      color: Colors.yellow,
      size: size,
    );
  }
}
