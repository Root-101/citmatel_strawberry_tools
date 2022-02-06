import 'package:flutter/material.dart';

class CommonsStarsGeneralIndicator extends StatelessWidget {
  final int winedStars;
  final int maxStars;

  const CommonsStarsGeneralIndicator({
    required this.winedStars,
    required this.maxStars,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$winedStars / $maxStars",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.stars,
          color: Colors.yellow,
        )
      ],
    );
  }
}
