import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class AnalyticsService {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  static void navigation(String route) async {
    debugPrint('logging navigation to: $route event');
    try {
      String screenName = route.replaceAll('/', '');

      if (screenName != "") {
        await analytics.logScreenView(
          screenName: screenName,
          screenClass: route,
        );
      } else {
        await analytics.logScreenView(
          screenName: 'home',
          screenClass: '/',
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static void login() async {
    debugPrint('logging login event');
    await analytics.logLogin();
  }
}
