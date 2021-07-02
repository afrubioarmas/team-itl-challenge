import 'package:flutter/material.dart';
import 'package:team_intl_challenge/misc/service_locator.dart';
import 'package:team_intl_challenge/navigators/primary_navigator/primary_navigator.dart';
import 'package:team_intl_challenge/navigators/primary_navigator/primary_routes.dart';
import 'package:team_intl_challenge/navigators/secondary_navigator/secondary_navigator.dart';
import 'package:team_intl_challenge/navigators/secondary_navigator/secondary_routes.dart';

import 'components/bottom_navigation.dart';

enum TabItem { PRIMARY, SECONDARY }

class Dashboard extends StatefulWidget {
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TabItem _currentTab = TabItem.PRIMARY;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.PRIMARY: locator<PrimaryNavigator>().navigatorKey,
    TabItem.SECONDARY: locator<SecondaryNavigator>().navigatorKey
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.PRIMARY) {
            _selectTab(TabItem.PRIMARY);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.PRIMARY),
          _buildOffstageNavigator(TabItem.SECONDARY),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.PRIMARY:
        return Offstage(
          offstage: _currentTab != tabItem,
          child: Navigator(
            key: locator<PrimaryNavigator>().navigatorKey,
            initialRoute: PrimaryRoutes.primary,
            onGenerateRoute: locator<PrimaryNavigator>().onGenerateRoute,
          ),
        );
        break;
      case TabItem.SECONDARY:
        return Offstage(
          offstage: _currentTab != tabItem,
          child: Navigator(
            key: locator<SecondaryNavigator>().navigatorKey,
            initialRoute: SecondaryRoutes.secondary,
            onGenerateRoute: locator<SecondaryNavigator>().onGenerateRoute,
          ),
        );
        break;

      default:
        return Offstage(
          offstage: _currentTab != tabItem,
          child: Navigator(
            key: locator<SecondaryNavigator>().navigatorKey,
            initialRoute: SecondaryRoutes.secondary,
            onGenerateRoute: locator<SecondaryNavigator>().onGenerateRoute,
          ),
        );
    }
  }
}
