import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_profle_application/Pages/DetailsPage.dart';
import 'package:flutter_profle_application/Pages/GeneralPage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // force portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      home: GeneralPage('Profile'),
      /*
      initialRoute: "/",
      routes: {
        "/DetailsPage": (context) => DetailsPage(null),
      },
      */
    );
  }
}

