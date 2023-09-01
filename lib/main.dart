import 'package:flutter/material.dart';
import 'package:insta_wall/pages/detail_page.dart';
import 'package:insta_wall/pages/home_page.dart';
import 'package:page_transition/page_transition.dart';

import 'services/constants.dart';

void main() {
  runApp(const InstaWall());
}

class InstaWall extends StatelessWidget {
  const InstaWall({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Constants.initialRoute,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case Constants.detailRoute:
              return PageTransition(
                child: const DetailsPage(),
                type: PageTransitionType.rightToLeft,
                duration: const Duration(seconds: 1),
                settings: settings,
              );
            case Constants.initialRoute:
              return PageTransition(
                child: const HomePage(),
                type: PageTransitionType.leftToRight,
                duration: const Duration(seconds: 1),
                settings: settings,
              );
            default:
              return null;
          }
        });
  }
}
