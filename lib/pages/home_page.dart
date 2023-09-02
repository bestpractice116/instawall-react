import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_wall/pages/photos_page.dart';
import '../components/bottom_navigation_bar.dart';
import 'favorite_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const PhotosPage(),
    const FavoritePage(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFf5f5f5),
          appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Color(0xFFe1e1e1),
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.light,
              ),
              backgroundColor: const Color(0xFFe1e1e1),
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "I N S T A W A L L",
                style: TextStyle(color: Color(0xFF232323)),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Color(0xFFf5f5f5),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Color(0xFF232323),
                      )),
                ),
              )),
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar:
              CustomBottomNavigationBar(onItemTapped: _onItemTapped)),
    );
  }
}
