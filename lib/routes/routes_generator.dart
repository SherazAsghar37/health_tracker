import 'package:flutter/material.dart';
import 'package:health_tracker/routes/fade_in_transition.dart';
import 'package:health_tracker/screens/health-details/health_details_screen.dart';
import 'package:health_tracker/screens/home/home_screen.dart';

Route<dynamic> routesGenerator(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case HealthDetailsScreen.routeName:
      return FadeInTransition(widget: const HealthDetailsScreen());

    default:
      return MaterialPageRoute(
        builder:
            (context) =>
                const Scaffold(body: Center(child: Text("Screen not found"))),
      );
  }
}
