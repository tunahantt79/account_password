import 'package:account_password2/home_page.dart';
import 'package:flutter/material.dart';

import 'profile_page.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int currentPageIndex = 0;

  List<Widget> pages = [
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30), label: 'Anasayfa'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, size: 30), label: 'Profil'),
        ],
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
