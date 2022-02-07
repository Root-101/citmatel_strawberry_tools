import 'package:flutter/material.dart';

class StrawberryCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget smallChild;
  final Widget largeChild;
  final double elevation;
  final double contentHeight;
  final Color? color;
  final Color? shadowColor;
  final bool changeOrderOfTheChilds;
  final Size appBarSize;
  final Function()? smallBarPressed;
  final Function()? largeBarPressed;

  @override
  final Size preferredSize;

  const StrawberryCustomAppBar(
      {Key? key,
      required this.smallChild,
      required this.largeChild,
      this.elevation = 10,
      this.contentHeight = 50,
      this.color,
      this.shadowColor,
      this.changeOrderOfTheChilds = false,
      this.appBarSize = const Size.fromHeight(60.0),
      this.smallBarPressed,
      this.largeBarPressed})
      : preferredSize = appBarSize,
        super(key: key);

  static const ShapeBorder topLeftBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
    ),
  );

  static const ShapeBorder bottomRightBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(30),
    ),
  );

  Widget buildLargeBarCard(ShapeBorder shapeBorder, BuildContext context) {
    return Card(
      elevation: elevation,
      shape: shapeBorder,
      color: color,
      shadowColor: shadowColor,
      child: InkWell(
        onTap: largeBarPressed,
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          height: contentHeight,
          child: largeChild,
        ),
      ),
    );
  }

  Widget buildSmallBarCard(ShapeBorder shapeBorder) {
    return Card(
      elevation: elevation,
      shape: shapeBorder,
      color: color,
      shadowColor: shadowColor,
      child: MaterialButton(
        height: contentHeight,
        minWidth: 50,
        elevation: elevation,
        shape: shapeBorder,
        onPressed: smallBarPressed,
        child: smallChild,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          changeOrderOfTheChilds
              ? buildSmallBarCard(bottomRightBarShape)
              : buildLargeBarCard(bottomRightBarShape, context),
          changeOrderOfTheChilds
              ? buildLargeBarCard(topLeftBarShape, context)
              : buildSmallBarCard(topLeftBarShape),
        ],
      ),
    );
  }
}
