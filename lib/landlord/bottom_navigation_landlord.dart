import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flat_finder/common/add_screen.dart';
import 'package:flat_finder/common/chat_screen.dart';
import 'package:flat_finder/common/profile_screen.dart';
import 'package:flat_finder/tenant/home_Screen.dart';
import 'package:flat_finder/tenant/saved_screen.dart';
import 'package:flat_finder/theme/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationLandlord extends StatefulWidget {
  const BottomNavigationLandlord({super.key});

  @override
  State<BottomNavigationLandlord> createState() => _BottomNavigationLandlordState();
}

class _BottomNavigationLandlordState extends State<BottomNavigationLandlord> {
  // index value that will help to change the screen on the tap of different index of bottom navigation
  int _indexValue = 0;

  // list of screen that is to be shown on the tap of each item
  final List<Widget> _screenList = [
    const ChatScreen(),
    AddScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_indexValue],
      // passing index value so screen will change dynamically
      bottomNavigationBar: CurvedNavigationBar(
        index: _indexValue,
        // update index
        onTap: (index) {
          setState(() {
            _indexValue = index; // updating index on each tap
          });
        },

        items: [
          // _buildNavItem is a method that is used to build nav item using this to customize items because CurvedNavigationBar doesn't provide attribute to customize the nav item
          _buildNavItem(Icons.chat, "Chat"),
          _buildNavItem(Icons.add_circle_outline_sharp, "Add"),
          _buildNavItem(Icons.person, "Profile"),
        ],
        color: AppColors().green,
        // it is the background color of navbar
        backgroundColor: Colors.transparent,
        // using transparent color so it will create a illusion that icon is separated from navbar
        buttonBackgroundColor: AppColors().blue,
        // background color of clicked item

        // speed of animation
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }

// this method is building bottom navigation's icons with custom design
  Widget _buildNavItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: 45,
        height: 45,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Icon(icon, size: 30, color: Colors.white),
            Positioned(
              bottom: 0,
              child: Text(
                label,
                style: const TextStyle(color: Colors.white,
                    fontSize: 12,
                    fontFamily: "Poppins-Semibold"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}