import 'package:flutter/material.dart';

class CommonsSingleLevel<SubLevelDomain> extends StatelessWidget {
  final String moduleName;
  final String themeTitle;
  final int maxStars;
  final int winedStars;

  final Function(SubLevelDomain sublevel) singleLevelBuilder;

  final List<SubLevelDomain> subLevelsAll;

  final String urlThemePicture;

  final int crossAxisCount;

  const CommonsSingleLevel({
    required this.moduleName,
    required this.themeTitle,
    required this.maxStars,
    required this.winedStars,
    required this.subLevelsAll,
    required this.singleLevelBuilder,
    required this.urlThemePicture,
    this.crossAxisCount = 2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(urlThemePicture),
          fit: BoxFit.cover,
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              //estrellas
              _buildStars(),
            ],
            /*expandedHeight: MediaQuery.of(context).size.height * 0.3,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.red,
              ),
            ),*/
            //para que salga cuando se escrolea hacia arriba aunque no haya llegado al principio
            floating: true,
            //titulo
            title: Text(themeTitle),
            //centrar el titulo
            centerTitle: true,
            //boton de regresar
            leading: const BackButton(color: Colors.black),
          ),
          SliverGrid.count(
            crossAxisCount: crossAxisCount,
            children: subLevelsAll
                .map(
                  (e) => Function.apply(singleLevelBuilder, [e]) as Widget,
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
