import 'package:flutter/material.dart';
import 'package:health_tracker/utils/colours.dart';
import 'package:health_tracker/utils/sizes.dart';
import 'package:health_tracker/widgets/app_text.dart';

class FlipCounter extends StatefulWidget {
  final int targetNumber;
  final Duration duration;
  final TextStyle? style;
  final int delay;
  final Color color;
  const FlipCounter({
    super.key,
    required this.targetNumber,
    this.duration = const Duration(seconds: 2),
    this.style,
    this.delay = 0,
    this.color = Colours.primaryTextColor,
  });

  @override
  State<FlipCounter> createState() => _FlipCounterState();
}

class _FlipCounterState extends State<FlipCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = IntTween(begin: 0, end: widget.targetNumber).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    );
    Future.delayed(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return AppText(
          text:
              widget.delay == 0
                  ? widget.targetNumber.toString()
                  : _animation.value.toString(),
          fontSize: AppSizes.fontSizeXXXl,
          color: widget.color,
          fontWeight: FontWeight.w600,
          height: AppSizes.unit,
        );
      },
    );
  }
}
