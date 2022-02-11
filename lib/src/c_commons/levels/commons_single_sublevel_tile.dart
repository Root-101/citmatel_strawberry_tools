import 'package:animations/animations.dart';
import 'package:citmatel_strawberry_tools/src/c_commons/all/commons_all_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonsSingleSubLevelTile extends StatelessWidget {
  final Color backgroundColor;
  final int stars;
  final int maxStars;
  final int startMultiplier;
  final int contPlayedTimes;
  final int level;
  final Widget openWidget;
  final Color colorPrimary;

  const CommonsSingleSubLevelTile({
    this.backgroundColor = Colors.grey,
    required this.stars,
    required this.maxStars,
    this.startMultiplier = 2, //por defecto dos para tener la media estrella
    required this.contPlayedTimes,
    required this.level,
    required this.openWidget,
    this.colorPrimary = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoundedRectangleBorder closedShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    );

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: OpenContainer(
        closedShape: closedShape,
        transitionDuration: const Duration(milliseconds: 500),
        transitionType: ContainerTransitionType.fadeThrough,
        closedBuilder: (context, action) => _buildClosed(),
        openBuilder: (context, action) => _buildOpen(),
        closedColor: colorPrimary,
        middleColor: colorPrimary,
      ),
    );
  }

  //Tile chiquito que se muestra en la lista con todos los subniveles
  _buildClosed() {
    return Container(
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Nivel: $level',
            style: Get.theme.textTheme.subtitle2,
          ),
          CommonsStarsIndicator(
            stars: stars,
            maxStars: maxStars,
            startMultiplier: startMultiplier,
          ),
          Text(
            'Intentos: $contPlayedTimes',
            style: Get.theme.textTheme.subtitle2,
          ),
        ],
      ),
    );
  }

  //Screen grande para cuando se entra al subnivel, pantalla de cargando para el sub nivel
  _buildOpen() {
    return openWidget;
  }
}
