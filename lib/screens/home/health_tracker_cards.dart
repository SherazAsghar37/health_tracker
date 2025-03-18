import 'package:flutter/material.dart';
import 'package:health_tracker/screens/home/home_screen_card.dart';
import 'package:health_tracker/utils/app_strings.dart';
import 'package:health_tracker/utils/colours.dart';
import 'package:health_tracker/utils/constants.dart';
import 'package:health_tracker/utils/sizes.dart';
import 'package:health_tracker/widgets/app_text.dart';

class HealtTrakerCards extends StatelessWidget {
  const HealtTrakerCards({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSizes.lg),
        AppText(
          text: AppStrings.homeTitle,
          fontSize: AppSizes.fontSizeLg,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: AppSizes.lg),
        HomeScreenCard(
          size: size,
          icon: Constants.heartIcon,
          title: AppStrings.heartRateCardTitile,
          progress: AppStrings.heartRateCardProgress,
          positiveProgress: false,
          value: AppStrings.heartRateCardValue,
          totalValue: AppStrings.heartRateCardTotalValue,
          percent: AppStrings.heartRateCardPercent,
          backgroundColor: Colours.primaryColor,
          contrastColor: Colours.secondaryTextColor,
          lightContrastColor: Colours.lightCardColor,
        ),
        SizedBox(height: AppSizes.sm),
        HomeScreenCard(
          size: size,
          icon: Constants.clockIcon,
          title: AppStrings.activeTimeCardTitle,
          progress: AppStrings.activeTimeCardProgress,
          positiveProgress: true,
          value: AppStrings.activeTimeCardValue,
          totalValue: AppStrings.activeTimeCardTotalValue,
          percent: AppStrings.activeTimeCardPercent,
        ),
        SizedBox(height: AppSizes.sm),
        HomeScreenCard(
          size: size,
          icon: Constants.fireIcon,
          title: AppStrings.caloriesCardTitle,
          progress: AppStrings.caloriesCardProgress,
          positiveProgress: true,
          value: AppStrings.caloriesCardValue,
          totalValue: AppStrings.caloriesCardTotalValue,
          percent: AppStrings.caloriesCardPercent,
          backgroundColor: Colours.secondaryColor,
          contrastColor: Colours.secondaryTextColor,
          lightContrastColor: Colours.lightCardColor,
        ),
        SizedBox(height: AppSizes.sm),
        HomeScreenCard(
          size: size,
          icon: Constants.locationIcon,
          title: AppStrings.stepsCardTitle,
          progress: AppStrings.stepsCardProgress,
          positiveProgress: true,
          value: AppStrings.stepsCardValue,
          totalValue: AppStrings.stepsCardTotalValue,
          percent: AppStrings.stepsCardPercent,
        ),
      ],
    );
  }
}
