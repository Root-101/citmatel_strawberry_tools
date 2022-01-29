import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:clean_core/clean_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_fab/sliver_fab.dart';

class CommonsLevelsThemeScreen<LevelDomain extends IntIdentifier>
    extends StatelessWidget {
  final List<LevelDomain> levelsFindAll;

  final CommonsLevelsThemeSingleTile tutorialTile;
  final Function(LevelDomain levelDomain) singleThemeTileBuilder;

  ///Widget que va a salir cuando se selecciona, el por detras se encarga de navegacion y scaffold y demas
  final Function onRandomTap;
  final String urlSliverBackground;

  final int crossAxisCount;
  final String title;

  CommonsLevelsThemeScreen({
    required this.tutorialTile,
    required this.levelsFindAll,
    required this.singleThemeTileBuilder,
    required this.urlSliverBackground,
    required this.onRandomTap,
    this.crossAxisCount = 2,
    this.title = "Temas",
    Key? key,
  }) : super(key: key) {
    levelsFindAll.removeWhere(
        (element) => element.id == tutorialTile.singleLevelDomain.id);
  }

  @override
  Widget build(BuildContext context) {
    double expandedHeight = MediaQuery.of(context).size.height * 0.3;
    return Scaffold(
      body: SliverFab(
        floatingWidget: StrawberryWidgets.circularButtonWithIcon(
          onPressed: () {
            Get.to(
              Scaffold(
                body: Function.apply(onRandomTap, []) as Widget,
              ),
            );
          },
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
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: [
              tutorialTile,
              ...levelsFindAll
                  .map(
                    (e) =>
                        Function.apply(singleThemeTileBuilder, [e]) as Widget,
                  )
                  .toList()
            ],
          )
        ],
      ),
    );
  }
}
