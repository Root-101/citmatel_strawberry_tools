import 'dart:ui';

import 'package:background_app_bar/background_app_bar.dart';
import 'package:citmatel_strawberry_tools/src/a_utils/strawberry_widgets.dart';
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
        /*FloatingActionButton(
            onPressed: () => Get.showSnackbar(
              const GetSnackBar(
                title: "Cosita linda te amooooooooo",
              ),
            ),
            child: const Icon(Icons.ac_unit),
          ),*/
        floatingPosition: const FloatingPosition(right: 16),
        expandedHeight: expandedHeight,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: expandedHeight,
            floating: true,
            pinned: true,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: const BackButton(color: Colors.white),
            flexibleSpace: BackgroundFlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              title: Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              centerTitle: true,
              titlePadding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
              background: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        urlSliverBackground,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
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
