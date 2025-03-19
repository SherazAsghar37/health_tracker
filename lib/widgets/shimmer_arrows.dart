import 'package:flutter/material.dart';
import 'package:health_tracker/utils/colours.dart';
import 'package:health_tracker/utils/sizes.dart';

class ShimmerArrows extends StatefulWidget {
  const ShimmerArrows({super.key});

  @override
  State<ShimmerArrows> createState() => _ShimmerArrowsState();
}

class _ShimmerArrowsState extends State<ShimmerArrows>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController.unbounded(vsync: this)
      ..repeat(min: -1, max: 1, period: const Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback:
              (bounds) => LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                transform: SliderGradientTransform(progress: _controller.value),
                colors: [Colors.white10, Colors.white, Colors.white10],
              ).createShader(bounds),
          child: Row(
            children: [
              Align(
                widthFactor: 0.5,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colours.whiteColor,
                  size: AppSizes.mdLg,
                ),
              ),
              Align(
                widthFactor: 1,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colours.whiteColor,
                  size: AppSizes.md,
                ),
              ),

              Align(
                widthFactor: 0.7,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colours.whiteColor,
                  size: AppSizes.mdLg - AppSizes.sm,
                ),
              ),
              SizedBox(width: AppSizes.lg),
            ],
          ),
        );
      },
    );
  }
}

class SliderGradientTransform extends GradientTransform {
  final double progress;

  const SliderGradientTransform({this.progress = 0.0});
  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * progress, 0, 0);
  }
}
