import 'package:flutter/material.dart';

class CommonsStarsGeneralIndicator extends StatelessWidget {
  final int winedStars;
  final int maxStars;
  final double size;

  const CommonsStarsGeneralIndicator({
    required this.winedStars,
    required this.maxStars,
    this.size = 20,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            Text(
              "$winedStars / $maxStars",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.stars,
              color: Colors.yellow,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
