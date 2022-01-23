import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class CommonsSingleSubLevelTile extends StatelessWidget {
  final Color color;
  final int stars;
  final int contPlayedTimes;
  final Widget openWidget;

  const CommonsSingleSubLevelTile({
    this.color = Colors.grey,
    required this.stars,
    required this.contPlayedTimes,
    required this.openWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OpenContainer(
        transitionDuration: const Duration(milliseconds: 500),
        transitionType: ContainerTransitionType.fadeThrough,
        closedBuilder: (context, action) => _buildClosed(),
        openBuilder: (context, action) => _buildOpen(),
      ),
    );
  }

  //Tile chiquito que se muestra en la lista con todos los subniveles
  _buildClosed() {
    return Container(
      color: color,
      child: Column(
        children: [
          Text('start $stars'),
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
