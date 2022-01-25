import 'package:flutter/material.dart';

class CommonsStarsIndicator extends StatelessWidget {
  final int maxStars;
  final int stars;
  bool filledStarsRight;

  CommonsStarsIndicator({
    required this.stars,
    required this.maxStars,
    this.filledStarsRight = true,
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
    return const Icon(
      Icons.star_border_outlined,
      color: Colors.yellow,
    );
  }

  Widget _buildFullStar() {
    return const Icon(
      Icons.star,
      color: Colors.yellow,
    );
  }
}
