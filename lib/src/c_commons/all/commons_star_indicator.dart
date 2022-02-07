import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class CommonsStarsIndicator extends StatelessWidget {
  final int maxStars;
  final int stars;
  final bool halfStarExits;
  bool filledStarsRight;

  CommonsStarsIndicator({
    required this.stars,
    required this.maxStars,
    this.halfStarExits = false,
    this.filledStarsRight = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: filledStarsRight
          ? [
              ..._buildAllEmpty(),
              ..._buildAllFull(),
            ]
          : [
              ..._buildAllFull(),
              _buildHalfStar(),
              ..._buildAllEmpty(),
            ],
    );
  }

  List<Widget> _buildAllEmpty() {
    return List.generate(maxStars - stars, (_) => _buildEmptyStar());
  }

  List<Widget> _buildAllFull() {
    return List.generate(stars, (_) => _buildFullStar());
  }

  Widget _buildEmptyStar() {
    return const FaIcon(
      FontAwesomeIcons.star,
      color: Colors.yellow,
    );
  }

  Widget _buildHalfStar() {
    return halfStarExits
        ? const FaIcon(
            FontAwesomeIcons.starHalfAlt,
            color: Colors.yellow,
          )
        : const SizedBox();
  }

  Widget _buildFullStar() {
    return const FaIcon(
      FontAwesomeIcons.solidStar,
      color: Colors.yellow,
    );
  }
}
