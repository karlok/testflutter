import 'package:flutter/material.dart';

class AnimatedGradientBackground extends StatefulWidget {
  final List<Color> colors;
  final Duration duration;

  AnimatedGradientBackground({
    required this.colors,
    this.duration = const Duration(seconds: 1),
  });

  @override
  _AnimatedGradientBackgroundState createState() => _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _beginAlignmentAnimation;
  late Animation<Alignment> _endAlignmentAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _beginAlignmentAnimation = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _endAlignmentAnimation = Tween<Alignment>(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.repeat(reverse: true); // <-- repeat AFTER everything is initialized
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: _beginAlignmentAnimation.value,
              end: _endAlignmentAnimation.value,
              colors: widget.colors,
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