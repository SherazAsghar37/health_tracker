import 'package:flutter/material.dart';
import 'package:health_tracker/utils/app_strings.dart';
import 'package:health_tracker/utils/colours.dart';
import 'package:health_tracker/utils/constants.dart';
import 'package:health_tracker/utils/sizes.dart';
import 'package:health_tracker/utils/utils.dart';
import 'package:health_tracker/widgets/app_text.dart';
import 'package:health_tracker/widgets/shimmer_arrows.dart';

class SwipeSlider extends StatefulWidget {
  const SwipeSlider({super.key});

  @override
  SwipeSliderState createState() => SwipeSliderState();
}

class SwipeSliderState extends State<SwipeSlider> {
  double _dragOffset = 0.0;
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      padding: EdgeInsets.all(AppSizes.smd),
      decoration: BoxDecoration(
        color: Colours.cardColor,
        borderRadius: BorderRadius.circular(
          AppSizes.borderRadiusXLg + (AppSizes.smd / 2),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onHorizontalDragUpdate: (details) async {
              if (_isDragging) return;
              _isDragging = true;
              setState(() {
                _dragOffset += details.primaryDelta!;
                _dragOffset = _dragOffset.clamp(
                  0.0,
                  size.width - 4 * AppSizes.xl,
                );
              });

              _isDragging = false;
            },
            onHorizontalDragEnd: (details) {
              setState(() {
                _dragOffset = 0.0;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeOut,
              transform: Matrix4.translationValues(_dragOffset, 0, 0),
              child: Container(
                width: AppSizes.xl * 2,
                height: AppSizes.xl * 2,
                padding: EdgeInsets.all(AppSizes.lg),
                decoration: BoxDecoration(
                  color: Colours.whiteColor,
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusXLg),
                ),
                child: Utils.svgIcon(
                  Constants.playIcon,
                  color: Colours.blackColor,
                  size: AppSizes.md,
                ),
              ),
            ),
          ),
          SizedBox(width: AppSizes.xl),
          AppText(
            text: AppStrings.sliderTitle,
            fontSize: AppSizes.fontSizeLg,
            fontWeight: FontWeight.w500,
          ),
          Spacer(),
          ShimmerArrows(),
        ],
      ),
    );
  }
}
