import 'package:flutter/material.dart';

class CommonsStarsIndicator extends StatelessWidget {
  final int maxStars;
  final int stars;

  const CommonsStarsIndicator({
    required this.stars,
    required this.maxStars,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        maxStars,
        (index) => index > stars ? _buildEmptyStar() : _buildFullStar(),
      ),
    );
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
