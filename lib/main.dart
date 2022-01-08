import 'package:citmatel_strawberry_tools/tools_exporter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tools Test',
      //--------------------- <THEAMING> -----------------------------------
      darkTheme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
      ),
      //--------------------- <PAGINATION> -----------------------------------
      initialRoute: StrawberryLevelLose.ROUTE_NAME,
      getPages: [
        GetPage(
          name: StrawberryLevelWin.ROUTE_NAME,
          page: () => const StrawberryLevelWin(),
          transition: Transition.circularReveal,
        ),
        GetPage(
          name: StrawberryLevelLose.ROUTE_NAME,
          page: () => const StrawberryLevelLose(),
          transition: Transition.leftToRightWithFade,
        ),
      ],
    );
  }
}
