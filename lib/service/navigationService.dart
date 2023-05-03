import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get getnavigatorKey {
    return navigatorKey;
  }
}
