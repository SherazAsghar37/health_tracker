import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:health_tracker/utils/app_strings.dart';
import 'package:health_tracker/utils/colours.dart';
import 'package:health_tracker/utils/constants.dart';
import 'package:health_tracker/utils/sizes.dart';
import 'package:health_tracker/utils/utils.dart';
import 'package:health_tracker/widgets/app_text.dart';

class ExercisesDetails extends StatelessWidget {
  const ExercisesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.md,
            horizontal: AppSizes.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSizes.md,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                spacing: AppSizes.sm,
                children: [
                  Utils.svgIcon(
                    Constants.heartIcon,
                    size: AppSizes.iconSm,
                    color: Colours.primaryColor,
                  ),
                  AppText(
                    text: AppStrings.exerciseTitle,
                    fontSize: AppSizes.mdLg,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ],
              ).fadeIn(
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 500),
              ),
              Wrap(
                spacing: AppSizes.sm,
                runSpacing: AppSizes.sm,
                children:
                    AppStrings.exercises
                        .asMap()
                        .entries
                        .map<Widget>(
                          (e) =>
                              e.key < 2
                                  ? SlideInLeft(
                                    delay: const Duration(milliseconds: 1000),
                                    duration: const Duration(milliseconds: 500),
                                    child: _exerciseCard(e),
                                  )
                                  : SlideInRight(
                                    delay: const Duration(milliseconds: 1000),
                                    duration: const Duration(milliseconds: 500),
                                    child: _exerciseCard(e),
                                  ),
                        )
                        .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _exerciseCard(MapEntry e) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.sm,
        horizontal: AppSizes.mdLg,
      ),

      decoration: BoxDecoration(
        color: Colours.cardColor,
        borderRadius: BorderRadius.circular(AppSizes.smd),
      ),
      child: AppText(
        text: e.value,
        fontSize: AppSizes.md,
        color: Colours.primaryTextColor,
        height: 1.5,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
