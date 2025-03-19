import 'package:flutter/material.dart';
import 'package:health_tracker/routes/routes_generator.dart';
import 'package:health_tracker/screens/home/home_screen.dart';
import 'package:health_tracker/utils/colours.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colours.primaryColor),
      ),
      onGenerateRoute: routesGenerator,
      home: const HomeScreen(),
    );
  }
}
