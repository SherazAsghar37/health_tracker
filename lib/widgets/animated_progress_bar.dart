import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:health_tracker/utils/constants.dart';
import 'package:health_tracker/utils/sizes.dart';

class AnimatedProgressBar extends StatefulWidget {
  final int progress; // Value between 0 and 100
  final int totalBlocks;
  final Color contrastColor;
  final Color lightContrastColor;
  final double blockWidth;
  final double blockHeight;
  final Duration delay;
  final bool animate;

  const AnimatedProgressBar({
    super.key,
    required this.progress,
    required this.totalBlocks,
    required this.contrastColor,
    required this.lightContrastColor,
    required this.blockWidth,
    required this.blockHeight,
    this.delay = const Duration(milliseconds: 2300),
    this.animate = true,
  });

  @override
  AnimatedProgressBarState createState() => AnimatedProgressBarState();
}

class AnimatedProgressBarState extends State<AnimatedProgressBar> {
  int filledCount = 0;
  bool startAnimation = false;
  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true; // Mark as mounted
    if (widget.animate) {
      Future.delayed(widget.delay, () {
        if (!_isMounted) return;

        setState(() {
          startAnimation = true;
        });

        animateProgress();
      });
    } else {
      filledCount = (widget.progress / 100 * widget.totalBlocks).round();
    }
  }

  void animateProgress() async {
    int targetFilled = (widget.progress / 100 * widget.totalBlocks).round();

    for (int i = 0; i <= targetFilled; i++) {
      await Future.delayed(const Duration(milliseconds: 100));

      if (!_isMounted) return;

      setState(() {
        filledCount = i;
      });
    }
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: List.generate(widget.totalBlocks, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              width:
                  (constraints.maxWidth -
                      (Constants.homeScreenProgressCount) * AppSizes.xxs * 2) /
                  Constants.homeScreenProgressCount,

              margin: EdgeInsets.symmetric(
                horizontal: AppSizes.xxs,
                vertical: AppSizes.xs,
              ),
              height: widget.blockHeight,
              decoration: BoxDecoration(
                color:
                    index < filledCount
                        ? widget.contrastColor
                        : widget.lightContrastColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }),
        );
      },
    );
  }
}
