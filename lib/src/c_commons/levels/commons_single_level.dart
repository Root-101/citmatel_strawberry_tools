import 'dart:ui';

import 'package:background_app_bar/background_app_bar.dart';
import 'package:citmatel_strawberry_tools/src/a_utils/strawberry_widgets.dart';
import 'package:flutter/material.dart';
import 'package:sliver_fab/sliver_fab.dart';

class CommonsSingleLevel<SubLevelDomain> extends StatelessWidget {
  final List<SubLevelDomain> subLevelsAll;

  final String themeTitle;
  final String urlThemePicture;

  final int maxStars;
  final int winedStars;

  final Function(SubLevelDomain subLevel) singleSubLevelTileBuilder;

  final int crossAxisCount;

  const CommonsSingleLevel({
    required this.themeTitle,
    required this.maxStars,
    required this.winedStars,
    required this.subLevelsAll,
    required this.urlThemePicture,
    required this.singleSubLevelTileBuilder,
    this.crossAxisCount = 2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double expandedHeight = MediaQuery.of(context).size.height * 0.3;
    return Scaffold(
      body: SliverFab(
        floatingWidget: StrawberryWidgets.circularButtonWithIcon(
          onPressed: () {},
          child: StrawberryWidgets.pulseIconAnimation(
              icon: Icons.radio_button_checked_sharp),
        ),
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
                themeTitle,
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
                        urlThemePicture,
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
            children: subLevelsAll
                .map(
                  (e) =>
                      Function.apply(singleSubLevelTileBuilder, [e]) as Widget,
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  _buildStars() {
    return Row(
      children: [
        Text("$winedStars  /  $maxStars"),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
