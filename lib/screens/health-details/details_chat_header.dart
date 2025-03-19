import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:health_tracker/utils/colours.dart';
import 'package:health_tracker/utils/sizes.dart';
import 'package:health_tracker/widgets/app_text.dart';

class DetailsChartHeader extends StatelessWidget {
  const DetailsChartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.md * 2,
      child: AnimationConfiguration.staggeredList(
        delay: const Duration(milliseconds: 500),
        duration: Duration(milliseconds: 1000),
        position: 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeInAnimation(
              child: AppText(
                text: "Your heartbeat",
                color: Colours.secondaryTextColor,
                fontSize: AppSizes.fontSizeXXl,
                fontWeight: FontWeight.w500,
              ),
            ),
            FadeInAnimation(
              child: Padding(
                padding: EdgeInsets.only(bottom: AppSizes.xs),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: AppSizes.xs,
                  children: [
                    AppText(
                      text: "Today",
                      color: Colours.secondaryTextColorlight,
                      height: -1,
                    ),

                    Transform.rotate(
                      angle: pi * 1.5,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: AppSizes.smd,
                        color: Colours.secondaryTextColorlight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
