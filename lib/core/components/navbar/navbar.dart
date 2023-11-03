import 'dart:developer';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../init/constants/color_constants.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int initialIndex;
  final Function(int) onTabSelected;

  CustomBottomNavigationBar({
    this.initialIndex = 0,
    required this.onTabSelected,
  });

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int _selectedIndex;
  late FloatingBottomBarController _controller;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _controller = FloatingBottomBarController(initialIndex: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      barColor: ColorConstants.primaryColor,
      controller: _controller,
      bottomBar: [
        _createBottomBarItem(Icons.home, 'Anasayfa'),
        _createBottomBarItem(Icons.add_box_outlined, 'İlanlarım'),
        _createBottomBarItem(Icons.favorite, 'Favorilerim'),
        _createBottomBarItem(Icons.person, 'Profil'),
      ],
      bottomBarCenterModel: BottomBarCenterModel(
        centerBackgroundColor: ColorConstants.secondaryColor,
        centerIcon: const FloatingCenterButton(
          child: Icon(
            Icons.photo_camera,
            color: ColorConstants.primaryColor,
          ),
        ),
        centerIconChild: [
          _createFloatingCenterButtonChild(Icons.photo_camera_back, 'Photo'),

        ],
      ),
    );
  }

  BottomBarItem _createBottomBarItem(IconData icon, String title) {
    return BottomBarItem(
      icon: Icon(icon, size: 24.0),
      iconSelected: Icon(icon, color: ColorConstants.secondaryColor, size: 24.0),
      title: title,
      dotColor: ColorConstants.secondaryColor,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        log(title + ' ' + index.toString());
        widget.onTabSelected(index);
      },
    );
  }

  FloatingCenterButtonChild _createFloatingCenterButtonChild(
      IconData icon, String logMessage) {
    return FloatingCenterButtonChild(
      child: Icon(
        icon,
        color: ColorConstants.secondaryColor,
      ),
      onTap: () => log(logMessage),
    );
  }
}
