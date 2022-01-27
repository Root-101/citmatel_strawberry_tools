import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class CommonsLevelsThemeSingleTile<LevelDomain> extends StatelessWidget {
  final LevelDomain singleLevelDomain;

  final Function(LevelDomain levelDomain) buildThemeName;
  final Function(LevelDomain levelDomain) buildThemeUrlImage;
  final Widget openWidget;

  final Color colorPrimary;

  const CommonsLevelsThemeSingleTile({
    required this.singleLevelDomain,
    required this.buildThemeName,
    required this.buildThemeUrlImage,
    required this.openWidget,
    this.colorPrimary = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 500),
      transitionType: ContainerTransitionType.fadeThrough,
      closedBuilder: (context, action) => _buildClosed(),
      openBuilder: (context, action) => _buildOpen(),
      closedColor: colorPrimary,
      middleColor: colorPrimary,
    );
  }

  //Tile chiquito que se muestra en la lista con todos los subniveles
  _buildClosed() {
    String imageUrl = Function.apply(
      buildThemeUrlImage,
      [singleLevelDomain],
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [_buildThemeTitle()],
        ),
      ),
    );
  }

  //Screen grande para cuando se entra al subnivel, pantalla de cargando para el sub nivel
  _buildOpen() {
    return openWidget;
  }

  _buildThemeTitle() {
    String themeName = Function.apply(
      buildThemeName,
      [singleLevelDomain],
    );
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: Text(
        themeName,
      ),
    );
  }
}
