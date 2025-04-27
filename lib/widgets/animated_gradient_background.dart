import 'package:flutter/material.dart';

class AnimatedGradientBackground extends StatefulWidget {
  final List<Color> colors1;
  final List<Color> colors2;
  final Duration duration;

  AnimatedGradientBackground({
    required this.colors1,
    required this.colors2,
    this.duration = const Duration(seconds: 2),
  });

  @override
  _AnimatedGradientBackgroundState createState() => _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: List.generate(widget.colors1.length, (index) {
                return Color.lerp(
                  widget.colors1[index],
                  widget.colors2[index],
                  _animation.value,
                )!;
              }),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}