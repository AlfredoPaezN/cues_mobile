import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:virtual_cues/core/utils/colors.dart';
import 'package:virtual_cues/modules/presentation/screens/cues_drawer/drawer_screen.dart';
import 'package:virtual_cues/modules/presentation/screens/home/home_screen.dart';
import 'package:virtual_cues/modules/presentation/screens/students/students_screen.dart';
import 'package:virtual_cues/modules/presentation/screens/teachers/teachers_screen.dart';
import 'package:virtual_cues/modules/presentation/widgets/background.dart';

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(
        Ionicons.home,
        size: 25,
        color: Color(CUES_Colors.secondary),
      ),
      inactiveIcon: const Icon(
        Ionicons.home,
        size: 25,
        color: Color(CUES_Colors.gray),
      ),
      title: 'Home',
      activeColorPrimary: const Color(CUES_Colors.secondary),
      inactiveColorPrimary: const Color(CUES_Colors.gray),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Ionicons.book_outline,
        size: 25,
        color: Color(CUES_Colors.secondary),
      ),
      inactiveIcon: const Icon(
        Ionicons.book_outline,
        size: 25,
        color: Color(CUES_Colors.gray),
      ),
      title: 'Stundent',
      activeColorPrimary: const Color(CUES_Colors.secondary),
      inactiveColorPrimary: const Color(CUES_Colors.gray),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Ionicons.people_outline,
        size: 25,
        color: Color(CUES_Colors.secondary),
      ),
      inactiveIcon: const Icon(
        Ionicons.people_outline,
        size: 25,
        color: Color(CUES_Colors.gray),
      ),
      title: 'Teachers',
      activeColorPrimary: const Color(CUES_Colors.secondary),
      inactiveColorPrimary: const Color(CUES_Colors.gray),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Ionicons.person_circle_outline,
        size: 25,
        color: Color(CUES_Colors.secondary),
      ),
      inactiveIcon: const Icon(
        Ionicons.person_circle_outline,
        size: 25,
        color: Color(CUES_Colors.gray),
      ),
      title: 'My Account',
      activeColorPrimary: const Color(CUES_Colors.secondary),
      inactiveColorPrimary: const Color(CUES_Colors.gray),
    ),
  ];
}

List<Widget> menuBuildScreens() {
  return [
    const Background(child: Home()),
    const Background(child: StudentsView()),
    const Background(child: TeachersView()),
    const Background(child: CuesDrawerView()),
  ];
}
