import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../dashboard.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(
            tabItem: TabItem.PRIMARY,
            iconData: FontAwesomeIcons.diceOne,
            context: context),
        _buildItem(
            tabItem: TabItem.SECONDARY,
            iconData: FontAwesomeIcons.diceTwo,
            context: context),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem(
      {TabItem tabItem,
      IconData iconData,
      BuildContext context,
      String title}) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: _colorTabMatching(item: tabItem, context: context),
      ),
      title: Container(),
    );
  }

  Color _colorTabMatching({TabItem item, BuildContext context}) {
    return currentTab == item ? Theme.of(context).primaryColor : Colors.grey;
  }
}
