import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CommonsLevelsThemeSingleTile<LevelDomain> extends StatelessWidget {
  final LevelDomain singleLevelDomain;

  final Function(LevelDomain levelDomain) buildThemeName;
  final Function(LevelDomain levelDomain) buildThemeUrlImage;
  final Widget openWidget;

  final Color colorPrimary;

  final int maxStars;
  final int winedStars;

  final bool wonedLevel;

  const CommonsLevelsThemeSingleTile({
    required this.singleLevelDomain,
    required this.buildThemeName,
    required this.buildThemeUrlImage,
    required this.openWidget,
    required this.maxStars,
    required this.winedStars,
    required this.wonedLevel,
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
          //_buildThemeStars(),//no stars for only dnd
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
      top: 10,
      right: 10,
      child: CommonsStarsGeneralIndicator(
        winedStars: winedStars,
        maxStars: maxStars,
        size: Get.size.width / 23,
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
      child: AutoSizeText(
        themeName,
        textAlign: TextAlign.center,
        style: Get.theme.textTheme.headline6?.copyWith(
          fontSize: Get.size.width / 13,
        ),
      ),
    );
  }

  _buildWoned() {
    return wonedLevel
        ? Positioned(
            top: 12,
            left: 12,
            child: DecoratedIcon(
              FontAwesomeIcons.medal,
              color: Colors.yellow.shade600,
              size: Get.size.width / 15,
              shadows: [
                const BoxShadow(
                  blurRadius: 12.0,
                  color: Colors.black,
                ),
                BoxShadow(
                  blurRadius: 12.0,
                  color: Colors.yellow.shade900,
                  offset: const Offset(0, 6.0),
                ),
              ],
            ),
          )
        : Container();
  }
}
