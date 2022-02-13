import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        color: Colors.black45,
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
              style: Get.textTheme.subtitle2?.copyWith(
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
