import 'package:flutter/material.dart';
import 'package:insta_wall/pages/home_page.dart';

void main() {
  runApp(const InstaWall());
}

class InstaWall extends StatelessWidget {
  const InstaWall({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
