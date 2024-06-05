import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:virtual_cues/core/utils/colors.dart';
import 'package:virtual_cues/modules/presentation/screens/app_navigation/bottom_navbar_style.dart';
import 'package:virtual_cues/routes/appbar_items.dart';

class AppNavigationView extends StatefulWidget {
  const AppNavigationView({super.key});

  @override
  State<AppNavigationView> createState() => _AppNavigationViewState();
}

class _AppNavigationViewState extends State<AppNavigationView> {
  PersistentTabController tabController = PersistentTabController();

  int pageIndexSelected = 0;
  String currentPageName = '';

  TextEditingController vehiclesAssigned = TextEditingController();

  List<DropdownMenuItem<String>> availableVehicles = [];

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreen() {
      return menuBuildScreens();
    }

    List<PersistentBottomNavBarItem> navBarItems() {
      return navBarsItems();
    }

    return Scaffold(
      bottomNavigationBar: Container(
        height: 10.h,
        color: Colors.white,
      ),
      body: PersistentTabView.custom(
        context,
        controller: tabController,
        itemCount: navBarItems().length,
        screens: buildScreen(),
        onWillPop: (context) async {
          return true;
        },
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
        ),
        customWidget: CustomNavBarWidget(
          items: navBarItems(),
          selectedIndex: pageIndexSelected,
          onItemSelected: (index) {
            tabController.index = index;
            pageIndexSelected = index;
            print('INDEX SELECTED: $index ${navBarItems()[index].title}');
            currentPageName = navBarItems()[index].title ?? '';
            setState(() {});
          },
        ),
      ),
    );
  }
}
