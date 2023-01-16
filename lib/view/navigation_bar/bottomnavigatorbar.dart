import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


import 'home/home_page.dart';
import 'profile/profile_page.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int currentPageIndex = 0;

  List<Widget> pages = [
    // const MessagePage(),
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentPageIndex],
        bottomNavigationBar: GNav(
          tabMargin: const EdgeInsets.all(8),
          style: GnavStyle.google,
          backgroundColor: Colors.transparent,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          tabBorderRadius: 15,
          curve: Curves.easeOutExpo, // tab animation curves
          duration: const Duration(milliseconds: 600), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          activeColor: Colors.blue, // selected icon and text color
          iconSize: 24, // tab button icon size
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 5), // navigation bar padding
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Ana Sayfa',
            ),
            // GButton(
            //   icon: Icons.message,
            //   text: 'Mesaj',
            // ),
            GButton(
              icon: Icons.account_circle,
              text: 'Profil',
            )
          ],
          selectedIndex: currentPageIndex,
          onTabChange: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ));
  }
}
