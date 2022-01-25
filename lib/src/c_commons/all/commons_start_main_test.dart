import 'package:citmatel_strawberry_tools/src/c_commons/all/commons_all_exporter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CommonStarTest());
}

class CommonStarTest extends StatelessWidget {
  const CommonStarTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tools Test',
      //--------------------- <THEAMING> -----------------------------------
      darkTheme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
      ),
      home: Scaffold(
        body: Center(
          child: CommonsStarsIndicator(
            stars: 2,
            maxStars: 3,
          ),
        ),
      ),
    );
  }
}
