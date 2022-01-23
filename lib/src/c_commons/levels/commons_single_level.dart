import 'package:flutter/material.dart';

class CommonsSingleLevel<SubLevelDomain> extends StatelessWidget {
  final Function(SubLevelDomain sublevel) singleLevelBuilder;

  final List<SubLevelDomain> subLevelsAll;

  final String urlThemePicture;

  final int crossAxisCount;

  const CommonsSingleLevel({
    required this.subLevelsAll,
    required this.singleLevelBuilder,
    required this.urlThemePicture,
    this.crossAxisCount = 2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(image: ),
      child: GridView(
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
        ),
        children: subLevelsAll
            .map(
              (e) => Function.apply(singleLevelBuilder, [e]) as Widget,
            )
            .toList(),
      ),
    );
  }
}
