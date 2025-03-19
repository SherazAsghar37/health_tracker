import 'package:animate_do/animate_do.dart';
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
  double width = AppSizes.xl * 2 + AppSizes.smd * 1.5;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 2600));
      setState(() {
        width = AppSizes.xl * 9 + AppSizes.smd * 2;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return ZoomIn(
      delay: const Duration(milliseconds: 1500),
      duration: const Duration(seconds: 1),
      curve: Curves.easeOut,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        width: width,
        height: AppSizes.xl * 2.5,
        curve: Curves.easeOut,
        padding: EdgeInsets.all(AppSizes.smd),
        decoration: BoxDecoration(
          color: Colours.cardColor,
          borderRadius: BorderRadius.circular(
            AppSizes.borderRadiusXLg + (AppSizes.sm / 2),
          ),
        ),
        child: Row(
          children: [
            GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _dragOffset += details.primaryDelta!;
                  _dragOffset = _dragOffset.clamp(0.0, size.width * 0.58);
                });
              },
              onHorizontalDragEnd: (details) {
                setState(() {
                  _dragOffset = 0.0;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeOut,
                width: AppSizes.xl * 1.8,
                transform: Matrix4.translationValues(_dragOffset, 0, 0),
                child: Container(
                  width: AppSizes.xl * 2,
                  height: AppSizes.xl * 2,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.lg - AppSizes.smd,
                    vertical: AppSizes.lg,
                  ),
                  decoration: BoxDecoration(
                    color: Colours.whiteColor,
                    borderRadius: BorderRadius.circular(
                      AppSizes.borderRadiusXLg,
                    ),
                  ),
                  child: Utils.svgIcon(
                    Constants.playIcon,
                    color: Colours.blackColor,
                    size: AppSizes.md,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: AppSizes.xl * 8.5 - AppSizes.smd * 5,
                  child: Row(
                    children: [
                      const SizedBox(width: AppSizes.md),
                      Expanded(
                        child: AppText(
                          text: AppStrings.sliderTitle,
                          fontSize: AppSizes.fontSizeLg,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      ShimmerArrows(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
