import 'package:flutter/material.dart';

class CommonsSliverAppBar {
  static SliverAppBar buildAppBar({
    required BuildContext context,
    required Color backgroundColor,
    required String title,
    required String urlBackgroundImage,
    double? expandedHeight,
    BorderRadius? borderRadius,
  }) {
    expandedHeight ??= MediaQuery.of(context).size.height * 0.3;
    borderRadius ??= const BorderRadius.vertical(bottom: Radius.circular(25));

    return SliverAppBar(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      expandedHeight: expandedHeight,
      floating: true,
      pinned: true,
      elevation: 2.0,
      backgroundColor: backgroundColor,
      leading: const BackButton(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(title),
        centerTitle: true,
        collapseMode: CollapseMode.pin,
        background: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: DecorationImage(
              image: AssetImage(urlBackgroundImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
