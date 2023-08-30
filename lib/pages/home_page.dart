import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFe1e1e1),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "I N S T A W A L L",
            style: TextStyle(color: Color(0xFF232323)),
          ),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Color(0xFF232323),
              )),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar());
  }
}
