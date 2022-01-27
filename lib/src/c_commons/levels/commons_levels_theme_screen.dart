import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';
import 'package:sliver_fab/sliver_fab.dart';

class CommonsLevelsThemeScreen<LevelDomain> extends StatelessWidget {
  final List<LevelDomain> levelsFindAll;

  final Function(LevelDomain levelDomain) singleThemeTileBuilder;
  final String urlSliverBackground;

  final int crossAxisCount;
  final String title;

  const CommonsLevelsThemeScreen({
    required this.levelsFindAll,
    required this.singleThemeTileBuilder,
    required this.urlSliverBackground,
    this.crossAxisCount = 2,
    this.title = "Temas",
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliverFab(
        floatingWidget: StrawberryWidgets.circularButtonWithIcon(
          onPressed: () {},
          child: StrawberryWidgets.pulseIconAnimation(icon: Icons.ac_unit),
        ),
        floatingPosition: const FloatingPosition(right: 16),
        slivers: <Widget>[
          CommonsSliverAppBar.buildAppBar(
            context: context,
            backgroundColor: Colors.indigoAccent,
            title: title,
            urlBackgroundImage: urlSliverBackground,
          ),
          SliverGrid.count(
            crossAxisCount: crossAxisCount,
            children: levelsFindAll
                .map(
                  (e) => Function.apply(singleThemeTileBuilder, [e]) as Widget,
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
