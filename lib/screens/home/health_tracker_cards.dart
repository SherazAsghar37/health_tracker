import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:health_tracker/screens/home/home_screen_card.dart';
import 'package:health_tracker/utils/app_strings.dart';
import 'package:health_tracker/utils/colours.dart';
import 'package:health_tracker/utils/constants.dart';
import 'package:health_tracker/utils/sizes.dart';
import 'package:health_tracker/widgets/app_text.dart';

class HealtTrakerCards extends StatelessWidget {
  const HealtTrakerCards({super.key, required this.cardSize});

  final Size cardSize;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSizes.lg),
        FadeIn(
          delay: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 800),
          child: AppText(
            text: AppStrings.homeTitle,
            fontSize: AppSizes.fontSizeLg,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppSizes.lg),
        Column(
          spacing: AppSizes.smd,
          children: [
            Hero(
              tag: 'heartRateCard',
              child: HomeScreenCard(
                cardSize: cardSize,
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
              ).fadeIn(
                delay: const Duration(seconds: 2, milliseconds: 200),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              ),
            ),

            HomeScreenCard(
                  cardSize: cardSize,
                  icon: Constants.clockIcon,
                  title: AppStrings.activeTimeCardTitle,
                  progress: AppStrings.activeTimeCardProgress,
                  positiveProgress: true,
                  value: AppStrings.activeTimeCardValue,
                  totalValue: AppStrings.activeTimeCardTotalValue,
                  percent: AppStrings.activeTimeCardPercent,
                )
                .fadeIn(
                  delay: const Duration(seconds: 2),
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeOut,
                )
                .slideDown(
                  from: size.height * 0.15,
                  delay: const Duration(milliseconds: 2200),
                  duration: const Duration(milliseconds: 1200),
                ),
            HomeScreenCard(
                  cardSize: cardSize,
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
                )
                .fadeIn(
                  delay: const Duration(seconds: 2),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                )
                .slideDown(
                  from: size.height * 0.3,
                  delay: const Duration(milliseconds: 2200),
                  duration: const Duration(milliseconds: 1200),
                ),
            HomeScreenCard(
                  cardSize: cardSize,
                  icon: Constants.locationIcon,
                  title: AppStrings.stepsCardTitle,
                  progress: AppStrings.stepsCardProgress,
                  positiveProgress: true,
                  value: AppStrings.stepsCardValue,
                  totalValue: AppStrings.stepsCardTotalValue,
                  percent: AppStrings.stepsCardPercent,
                  delay: const Duration(milliseconds: 2000),
                )
                .zoomIn(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                  delay: const Duration(seconds: 1),
                )
                .slideDown(
                  from: size.height * 0.45,
                  delay: const Duration(milliseconds: 2200),
                  duration: const Duration(milliseconds: 1200),
                ),
          ],
        ),
      ],
    );
  }
}
