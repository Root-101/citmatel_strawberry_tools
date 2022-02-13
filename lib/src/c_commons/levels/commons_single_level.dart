import 'package:citmatel_strawberry_tools/src/a_utils/strawberry_widgets.dart';
import 'package:citmatel_strawberry_tools/src/c_commons/commons_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_fab/sliver_fab.dart';

class CommonsSingleLevel<SubLevelDomain> extends StatelessWidget {
  final List<SubLevelDomain> subLevelsAll;

  final String themeTitle;
  final String urlThemePicture;
  final Color colorPrimary;
  final Color colorSecondary;

  final int maxStars;
  final int winedStars;

  ///Widget que va a salir cuando se selecciona, el por detras se encarga de navegacion y scaffold y demas
  final dynamic levelDomain;
  final Function onRandomOfTap;

  final Function(SubLevelDomain subLevel) singleSubLevelTileBuilder;

  final int crossAxisCount;

  const CommonsSingleLevel({
    required this.themeTitle,
    required this.urlThemePicture,
    required this.colorPrimary,
    required this.colorSecondary,
    required this.maxStars,
    required this.winedStars,
    required this.subLevelsAll,
    required this.singleSubLevelTileBuilder,
    required this.levelDomain,
    required this.onRandomOfTap,
    this.crossAxisCount = 2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius =
        const BorderRadius.vertical(bottom: Radius.circular(25));
    //const BorderRadius.all(Radius.elliptical(100, 50));

    double expandedHeight = MediaQuery.of(context).size.height * 0.3;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: colorSecondary,
        child: SliverFab(
          floatingWidget: StrawberryWidgets.circularButtonWithIcon(
            backgroundColor: const Color(0xff00a4db),
            splashColor: const Color(0xff002edb).withOpacity(0.5),
            onPressed: () {
              Get.to(
                Scaffold(
                  body: Function.apply(onRandomOfTap, [levelDomain]) as Widget,
                ),
              );
            },
            child: StrawberryWidgets.pulseIconAnimation(
              icon: Icons.shuffle, //TODO: icons
            ),
          ),
          floatingPosition: const FloatingPosition(right: 16),
          expandedHeight: expandedHeight,
          slivers: <Widget>[
            CommonsSliverAppBar.buildAppBar(
              expandedHeight: expandedHeight,
              backgroundColor: colorPrimary,
              title: themeTitle,
              urlBackgroundImage: urlThemePicture,
              maxStars: maxStars,
              winedStars: winedStars,
            ),
            SliverGrid.count(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              children: subLevelsAll
                  .map(
                    (e) => Function.apply(singleSubLevelTileBuilder, [e])
                        as Widget,
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
