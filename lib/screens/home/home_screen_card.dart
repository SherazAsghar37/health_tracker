import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:health_tracker/screens/health-details/health_details_screen.dart';
import 'package:health_tracker/screens/home/home_screen_card_body.dart';
import 'package:health_tracker/utils/colours.dart';
import 'package:health_tracker/utils/sizes.dart';

class HomeScreenCard extends StatefulWidget {
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
  final Duration delay;
  final Duration flipCounterDelay;
  final Duration progressBarDelay;
  final bool bottomBorder;
  final bool animate;
  final EdgeInsets padding;
  const HomeScreenCard({
    super.key,
    required this.cardSize,
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
    this.delay = const Duration(milliseconds: 2500),
    this.flipCounterDelay = const Duration(milliseconds: 2000),
    this.progressBarDelay = const Duration(milliseconds: 2300),
    this.bottomBorder = true,
    this.animate = true,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSizes.lg,
      vertical: AppSizes.fontSizeLg,
    ),
  });

  final Size cardSize;

  @override
  State<HomeScreenCard> createState() => _HomeScreenCardState();
}

class _HomeScreenCardState extends State<HomeScreenCard> {
  Size? cardSize;
  bool shifted = false;
  @override
  void initState() {
    cardSize = widget.cardSize;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          shifted = true;
          cardSize = Size(size.width, cardSize!.height * 4);
          Future.delayed(
            const Duration(milliseconds: 500),
            () => Navigator.pushNamed(context, HealthDetailsScreen.routeName),
          );
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: cardSize!.height,
        padding: widget.padding,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSizes.xl),
            topRight: Radius.circular(AppSizes.xl),
            bottomLeft:
                widget.bottomBorder
                    ? Radius.circular(AppSizes.xl)
                    : Radius.zero,
            bottomRight:
                widget.bottomBorder
                    ? Radius.circular(AppSizes.xl)
                    : Radius.zero,
          ),
        ),
        child:
            widget.animate
                ? FadeIn(
                  duration: const Duration(milliseconds: 1500),
                  delay: widget.delay,
                  child: HomeScreenCardBody(widget: widget, size: size),
                )
                : HomeScreenCardBody(widget: widget, size: size),
      ),
    );
  }
}
