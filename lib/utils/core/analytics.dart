import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class GoRouterObserver extends NavigatorObserver {
  final FirebaseAnalytics analytics;

  GoRouterObserver({required this.analytics});

  @override
  void didPush(Route route, Route? previousRoute) {
    analytics.setCurrentScreen(screenName: route.settings.name);
    super.didPush(route, previousRoute);
  }
}
