import 'package:animations/animations.dart';
import 'package:citmatel_strawberry_tools/src/c_commons/all/commons_all_exporter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonsLevelsThemeSingleTile<LevelDomain> extends StatelessWidget {
  final LevelDomain singleLevelDomain;

  final Function(LevelDomain levelDomain) buildThemeName;
  final Function(LevelDomain levelDomain) buildThemeUrlImage;
  final Widget openWidget;

  final Color colorPrimary;

  final int maxStars;
  final int winedStars;

  const CommonsLevelsThemeSingleTile({
    required this.singleLevelDomain,
    required this.buildThemeName,
    required this.buildThemeUrlImage,
    required this.openWidget,
    required this.maxStars,
    required this.winedStars,
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
    String imageUrl = Function.apply(
      buildThemeUrlImage,
      [singleLevelDomain],
    );
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          _buildThemeTitle(),
          _buildThemeStars(),
          _buildWoned(),
        ],
      ),
    );
  }

  //Screen grande para cuando se entra al subnivel, pantalla de cargando para el sub nivel
  _buildOpen() {
    return openWidget;
  }

  _buildThemeStars() {
    return Positioned(
      top: 20,
      right: 20,
      child: CommonsStarsGeneralIndicator(
        winedStars: winedStars,
        maxStars: maxStars,
      ),
    );
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
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _buildWoned() {
    return winedStars >= maxStars
        ? const Positioned(
            bottom: 0,
            right: 0,
            child: Icon(
              Icons.done_outline_sharp,
              color: Colors.lightGreen,
              size: 50,
            ),
          )
        : Container();
  }
}
