import 'package:flutter/material.dart';

class StrawberryCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  // The small child in the app bar.
  final Widget smallChild;
  // The large child in the app bar.
  final Widget largeChild;
  // The elevation of the app bar, meaning the cards.
  final double elevation;
  // The height of the contents in the bar.
  final double contentHeight;
  // The opacity in the color of the bar.
  final double opacity;
  // This bool changes the order of the childs.
  // Meaning that in false the large child is to the left and the small one to the rigth.
  // If it is set to true the large child will be in the right and the small one in the left.
  final bool changeOrderOfTheChilds;
  // The size this widget would prefer if it were otherwise unconstrained.
  final Size appBarSize;
  // The function that will be call when the small child is pressed.
  final Function()? smallBarPressed;
  // The function that will be call when the large child is pressed.
  final Function()? largeBarPressed;

  @override
  final Size preferredSize;

  const StrawberryCustomAppBar(
      {Key? key,
      required this.smallChild,
      required this.largeChild,
      this.elevation = 10,
      this.contentHeight = 30,
      this.opacity = 0.2,
      this.changeOrderOfTheChilds = false,
      this.appBarSize = const Size.fromHeight(40.0),
      this.smallBarPressed,
      this.largeBarPressed})
      : preferredSize = appBarSize,
        super(key: key);

  // This makes a cicular border in the top left.
  static const BorderRadius topLeftBarShape = BorderRadius.only(
    topLeft: Radius.circular(30),
  );

  // This makes a cicular border in the bottom right..
  static const BorderRadius bottomRightBarShape = BorderRadius.only(
    bottomRight: Radius.circular(30),
  );

  Widget buildLargeBarCard(BorderRadius shapeBorder, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      decoration: BoxDecoration(
        borderRadius: shapeBorder,
        color: Colors.black.withOpacity(opacity),
      ),
      child: MaterialButton(
        height: contentHeight,
        minWidth: MediaQuery.of(context).size.width / 1.3,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: shapeBorder,
        ),
        onPressed: largeBarPressed,
        child: largeChild,
      ),

      // child: InkWell(
      //   onTap: largeBarPressed,
      //   child: SizedBox(
      //     width: MediaQuery.of(context).size.width / 1.3,
      //     height: contentHeight,
      //     child: largeChild,
      //   ),
      // ),
    );
  }

  Widget buildSmallBarCard(BorderRadius shapeBorder) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: shapeBorder,
        color: Colors.black.withOpacity(opacity),
      ),
      child: MaterialButton(
        height: contentHeight,
        minWidth: 30,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: shapeBorder,
        ),
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

//////////////  EXAMPLE   /////////////////
// Scaffold(
//         appBar: const StrawberryCustomAppBar(
//           largeChild: Center(
//               child: Text(
//             'Title',
//             style: TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//             ),
//           )),
//           smallChild: Icon(
//             Icons.ac_unit,
//             color: Colors.black,
//           ),
//         ),
// ),
