import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:virtual_cues/core/utils/colors.dart';

class CustomNavBarWidget extends StatelessWidget {
  const CustomNavBarWidget({
    required this.items,
    super.key,
    this.selectedIndex,
    this.onItemSelected,
  });

  final int? selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int>? onItemSelected;

  Widget _buildItem({
    required PersistentBottomNavBarItem item,
    required bool isSelected,
  }) {
    return Container(
      color: const Color(CUES_Colors.primary),
      alignment: Alignment.center,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                size: 26,
                color: isSelected
                    ? (item.activeColorSecondary ?? item.activeColorPrimary)
                    : item.inactiveColorPrimary ?? item.activeColorPrimary,
              ),
              child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                child: Text(
                  item.title ?? '',
                  style: TextStyle(
                    color: isSelected
                        ? (item.activeColorSecondary ?? item.activeColorPrimary)
                        : item.inactiveColorPrimary,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(CUES_Colors.primary),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            final index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  if (onItemSelected != null) {
                    onItemSelected!(index);
                  }
                },
                child: Container(
                  color: Colors.transparent,
                  child: _buildItem(
                    item: item,
                    isSelected: selectedIndex == index,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
