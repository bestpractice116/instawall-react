import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFe1e1e1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: GNav(
          backgroundColor: const Color(0xFFe1e1e1),
          color: const Color(0xFF232323),
          activeColor: const Color(0xFF7c7c7c),
          tabBackgroundColor: const Color(0xFFf5f5f5),
          gap: 8,
          padding: const EdgeInsets.all(16),
          onTabChange: (index) {
            print(index);
          },
          tabs: const [
            GButton(
              icon: Icons.photo_library_outlined,
              text: "Photos",
            ),
            GButton(
              icon: Icons.search,
              text: "Search",
            ),
            GButton(
              icon: Icons.favorite_border,
              text: "Likes",
            ),
            GButton(
              icon: Icons.settings,
              text: "Settings",
            )
          ],
        ),
      ),
    );
  }
}
