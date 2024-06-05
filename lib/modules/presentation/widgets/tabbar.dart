import 'package:flutter/material.dart';
import 'package:virtual_cues/core/utils/colors.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    required this.title,
    required this.tabs,
    required this.children,
    super.key,
  });
  final String title;
  final List<Tab> tabs;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(CUES_Colors.primary), Colors.blue],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: tabs,
            ),
            elevation: 20,
            titleSpacing: 20,
          ),
          body: TabBarView(children: children),
        ),
      );
}
