import 'dart:math';

import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:clean_core/clean_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sliver_fab/sliver_fab.dart';

class CommonsLevelsThemeScreen<LevelDomain extends IntIdentifier>
    extends StatelessWidget {
  final List<LevelDomain> levelsFindAll;

  final CommonsLevelsThemeSingleTile tutorialTile;
  final Function(LevelDomain levelDomain) singleThemeTileBuilder;

  ///Widget que va a salir cuando se selecciona, el por detras se encarga de navegacion y scaffold y demas
  final Function onRandomTap;
  final bool mute;
  final String urlSliverBackground;
  final Color backgroundColor;
  final Color appbarBackgroundColor;

  final int crossAxisCount;
  final String title;

  final int maxStars;
  final int winedStars;

  CommonsLevelsThemeScreen({
    required this.tutorialTile,
    required this.levelsFindAll,
    required this.singleThemeTileBuilder,
    required this.urlSliverBackground,
    required this.onRandomTap,
    this.crossAxisCount = 2,
    this.title = "Temas",
    this.backgroundColor = Colors.grey,
    this.appbarBackgroundColor = Colors.redAccent,
    this.mute = false,
    required this.maxStars,
    required this.winedStars,
    Key? key,
  }) : super(key: key) {
    levelsFindAll.removeWhere(
        (element) => element.id == tutorialTile.singleLevelDomain.id);
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double expandedHeight = Get.size.height * 0.3;
    //si es menos de 56 que es el por defecto lanza excepcion
    double collapsedHeight = max(Get.size.width / 10, 60);

    double randomWidth = deviceSize.width / 17;

    //scaffold para el fondo blanco
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: backgroundColor,
        child: SliverFab(
          floatingWidget: StrawberryWidgets.circularButtonWithIcon(
            size: deviceSize.width / 9,
            backgroundColor: const Color(0xff00a4db),
            splashColor: const Color(0xff002edb).withOpacity(0.5),
            onPressed: () {
              Get.to(
                Scaffold(
                  body: Function.apply(onRandomTap, [mute]) as Widget,
                ),
              );
            },
            child: Pulse(
              child: Tooltip(
                child: FaIcon(
                  FontAwesomeIcons.random,
                  size: randomWidth,
                  color: Colors.white,
                ),
                message: "Nivel Aleatorio.",
              ),
            ),
          ),
          floatingPosition: FloatingPosition(
            right: 16,
            top: -(2 * randomWidth - 48),
          ),
          //formula para que el boton no caiga encima de la puntuacion
          expandedHeight: expandedHeight,
          slivers: <Widget>[
            CommonsSliverAppBar.buildAppBar(
              expandedHeight: expandedHeight,
              collapsedHeight: collapsedHeight,
              backgroundColor: appbarBackgroundColor,
              title: title,
              urlBackgroundImage: urlSliverBackground,
              maxStars: maxStars,
              winedStars: winedStars,
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
      ),
    );
  }
}
