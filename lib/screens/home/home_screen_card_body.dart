import 'dart:math';
import 'package:flutter/material.dart';
import 'package:health_tracker/screens/home/home_screen_card.dart';
import 'package:health_tracker/utils/constants.dart';
import 'package:health_tracker/utils/sizes.dart';
import 'package:health_tracker/utils/utils.dart';
import 'package:health_tracker/widgets/animated_progress_bar.dart';
import 'package:health_tracker/widgets/app_text.dart';
import 'package:health_tracker/widgets/flip_counter.dart';

class HomeScreenCardBody extends StatelessWidget {
  const HomeScreenCardBody({
    super.key,
    required this.widget,
    required this.size,
  });

  final HomeScreenCard widget;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSizes.sm,
      children: [
        Row(
          spacing: AppSizes.xs,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils.svgIcon(
              widget.icon,
              size: AppSizes.iconSm,
              color: widget.contrastColor,
            ),
            AppText(
              text: widget.title,
              fontSize: AppSizes.fontSizeMd,
              color: widget.contrastColor,
              fontWeight: FontWeight.w500,
              height: AppSizes.unit,
            ),
            Spacer(),
            AppText(
              text: widget.progress,
              fontSize: AppSizes.fontSizeMd,
              color: widget.contrastColor,
              fontWeight: FontWeight.w500,
              height: AppSizes.unit,
            ),
            Transform.translate(
              offset: Offset(
                0,
                widget.positiveProgress ? AppSizes.xxs : AppSizes.md,
              ),
              child: Transform(
                transform:
                    Matrix4.identity()
                      ..rotateX(widget.positiveProgress ? 0 : pi),

                child: Utils.svgIcon(
                  Constants.trendIcon,
                  size: AppSizes.iconXs,
                  color: widget.contrastColor,
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppText(
              text: widget.value,
              fontSize: AppSizes.fontSizeMd,
              color: widget.contrastColor,
              fontWeight: FontWeight.w500,
              height: AppSizes.unit,
            ),
            AppText(
              text: widget.totalValue,
              fontSize: AppSizes.fontSizeMd,
              color: widget.lightContrastColor,
              fontWeight: FontWeight.w500,
              height: AppSizes.unit,
            ),
            Spacer(),
            FlipCounter(
              delay: widget.flipCounterDelay.inMilliseconds,
              targetNumber: min(
                int.parse(
                  widget.percent.substring(0, widget.percent.length - 1),
                ),
                100,
              ),
              color: widget.contrastColor,
            ),
            AppText(
              text: widget.percent.substring(widget.percent.length - 1),
              fontSize: AppSizes.fontSizeXXXl,
              color: widget.contrastColor,
              fontWeight: FontWeight.w600,
              height: AppSizes.unit,
            ),
          ],
        ),
        AnimatedProgressBar(
          progress: min(
            int.parse(widget.percent.substring(0, widget.percent.length - 1)),
            100,
          ),
          delay: widget.progressBarDelay,
          totalBlocks: Constants.homeScreenProgressCount,
          contrastColor: widget.contrastColor,
          lightContrastColor: widget.lightContrastColor,
          blockWidth: (size.width / 6) - (AppSizes.xxs * 2 * 4.5),
          blockHeight: AppSizes.xs,
          animate: widget.animate,
        ),
      ],
    );
  }
}
