import 'package:flutter/material.dart';
import 'package:health_tracker/screens/home/health_tracker_cards.dart';
import 'package:health_tracker/utils/colours.dart';
import 'package:health_tracker/utils/sizes.dart';
import 'package:health_tracker/widgets/custom_app_bar.dart';
import 'package:health_tracker/screens/home/swipe_slider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.backgroundColor,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HealtTrakerCards(cardSize: Size(0, AppSizes.xl * 3.7)),
                SizedBox(height: AppSizes.md),
                SwipeSlider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
