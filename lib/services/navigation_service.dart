import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void pop() {
    return _navigationKey.currentState?.pop();
  }

  Future<dynamic>? navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic>? navigateToAndPop(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        ?.popAndPushNamed(routeName, arguments: arguments);
  }

  Future<dynamic>? popAllAndNavigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }
}
