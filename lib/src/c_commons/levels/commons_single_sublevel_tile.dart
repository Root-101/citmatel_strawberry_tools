import 'package:animations/animations.dart';
import 'package:citmatel_strawberry_tools/src/c_commons/all/commons_all_exporter.dart';
import 'package:flutter/material.dart';

class CommonsSingleSubLevelTile extends StatelessWidget {
  final Color color;
  final int stars;
  final int maxStars;
  final int contPlayedTimes;
  final Widget openWidget;

  final Color colorPrimary;

  const CommonsSingleSubLevelTile({
    this.color = Colors.grey,
    required this.stars,
    required this.maxStars,
    required this.contPlayedTimes,
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
      color: color,
      child: Column(
        children: [
          CommonsStarsIndicator(stars: stars, maxStars: maxStars),
          Text('played times $contPlayedTimes'),
        ],
      ),
    );
  }

  //Screen grande para cuando se entra al subnivel, pantalla de cargando para el sub nivel
  _buildOpen() {
    return openWidget;
  }
}
