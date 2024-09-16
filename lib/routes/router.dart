import 'package:movie_db/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../utils/bottom_nav_bar/bottom_nav_bar_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePaths.bottomViewRoute:
      return _getPageRoute(
          routeName: settings.name!, view: BottomNavBarScreen(index: 0));

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({required String routeName, required Widget view}) {
  print('Navigating To $routeName');
  return PageTransition(
    matchingBuilder: const CupertinoPageTransitionsBuilder(),
      type: PageTransitionType.rightToLeft, child: SafeArea(top : false,bottom: false,child: view));
}
