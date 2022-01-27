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
    double expandedHeight = MediaQuery.of(context).size.height * 0.3;
    return Scaffold(
      body: SliverFab(
        floatingWidget: StrawberryWidgets.circularButtonWithIcon(
          onPressed: () {},
          child: StrawberryWidgets.pulseIconAnimation(icon: Icons.ac_unit),
        ),
        floatingPosition: const FloatingPosition(right: 16),
        expandedHeight: expandedHeight,
        slivers: <Widget>[
          CommonsSliverAppBar.buildAppBar(
            context: context,
            expandedHeight: expandedHeight,
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
