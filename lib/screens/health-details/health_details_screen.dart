import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:health_tracker/screens/health-details/detail_card.dart';
import 'package:health_tracker/screens/health-details/exercises_detials.dart';
import 'package:health_tracker/utils/colours.dart';

class HealthDetailsScreen extends StatelessWidget {
  static const routeName = '/health-details';
  const HealthDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colours.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailCard(size: size),
              ExercisesDetails().fadeIn(duration: Duration(milliseconds: 1000)),
            ],
          ),
        ),
      ),
    );
  }
}
