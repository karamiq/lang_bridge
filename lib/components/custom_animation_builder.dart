import 'package:flutter/material.dart';

class CustomAnimationBuilder extends StatefulWidget {
  const CustomAnimationBuilder({
    super.key,
    required this.builder,
  });
  final Widget Function(AnimationController) builder;

  @override
  State<CustomAnimationBuilder> createState() => _CustomAnimationBuilderState();
}

class _CustomAnimationBuilderState extends State<CustomAnimationBuilder> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return widget.builder(animationController);
      },
    );
  }
}
