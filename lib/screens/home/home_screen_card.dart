import 'dart:math';
import 'package:flutter/material.dart';
import 'package:health_tracker/utils/colours.dart';
import 'package:health_tracker/utils/constants.dart';
import 'package:health_tracker/utils/sizes.dart';
import 'package:health_tracker/utils/utils.dart';
import 'package:health_tracker/widgets/app_text.dart';

class HomeScreenCard extends StatelessWidget {
  final String icon;
  final String title;
  final String progress;
  final bool positiveProgress;
  final String value;
  final String totalValue;
  final String percent;
  final Color backgroundColor;
  final Color contrastColor;
  final Color lightContrastColor;
  const HomeScreenCard({
    super.key,
    required this.size,
    required this.icon,
    required this.title,
    required this.progress,
    required this.positiveProgress,
    required this.value,
    required this.totalValue,
    required this.percent,
    this.backgroundColor = Colours.cardColor,
    this.contrastColor = Colours.whiteColor,
    this.lightContrastColor = Colours.primaryTextColorLight,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.lg,
        vertical: AppSizes.fontSizeLg,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.xl),
      ),
      child: Column(
        spacing: AppSizes.sm,
        children: [
          Row(
            spacing: AppSizes.xs,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Utils.svgIcon(icon, size: AppSizes.iconSm, color: contrastColor),
              AppText(
                text: title,
                fontSize: AppSizes.fontSizeMd,
                color: contrastColor,
                fontWeight: FontWeight.w500,
                height: AppSizes.unit,
              ),
              Spacer(),
              AppText(
                text: progress,
                fontSize: AppSizes.fontSizeMd,
                color: contrastColor,
                fontWeight: FontWeight.w500,
                height: AppSizes.unit,
              ),
              Transform.translate(
                offset: Offset(
                  0,
                  positiveProgress ? AppSizes.xxs : AppSizes.md,
                ),
                child: Transform(
                  transform:
                      Matrix4.identity()..rotateX(positiveProgress ? 0 : pi),

                  child: Utils.svgIcon(
                    Constants.trendIcon,
                    size: AppSizes.iconXs,
                    color: contrastColor,
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText(
                text: value,
                fontSize: AppSizes.fontSizeMd,
                color: contrastColor,
                fontWeight: FontWeight.w500,
                height: AppSizes.unit,
              ),
              AppText(
                text: totalValue,
                fontSize: AppSizes.fontSizeMd,
                color: lightContrastColor,
                fontWeight: FontWeight.w500,
                height: AppSizes.unit,
              ),
              Spacer(),
              AppText(
                text: percent,
                fontSize: AppSizes.fontSizeXXXl,
                color: contrastColor,
                fontWeight: FontWeight.w600,
                height: AppSizes.unit,
              ),
            ],
          ),
          Row(
            children: List.generate(Constants.homeScreenProgressCount, (index) {
              int value = min(
                int.parse(percent.substring(0, percent.length - 1)),
                100,
              );
              int filledCount =
                  (value / 100 * Constants.homeScreenProgressCount).round();

              return Container(
                width: (size.width / 6) - (AppSizes.xxs * 2 * 4.5),
                margin: EdgeInsets.symmetric(
                  horizontal: AppSizes.xxs,
                  vertical: AppSizes.xs,
                ),
                height: AppSizes.xs,
                decoration: BoxDecoration(
                  color:
                      index < filledCount
                          ? contrastColor
                          : lightContrastColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
