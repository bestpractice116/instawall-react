import 'package:flutter/material.dart';
import 'package:insta_wall/pages/detail_page.dart';
import 'package:insta_wall/pages/home_page.dart';

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
      initialRoute: Constants.initialRoute,
      routes: {
        Constants.initialRoute: (context) => const HomePage(),
        Constants.detailRoute: (context) => const DetailsPage()
      },
    );
  }
}
