import 'dart:math';

import 'package:virtual_cues/core/utils/colors.dart';
import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  const Background({required this.child, super.key});
  final Widget child;

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/animated.gif',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        widget.child,
      ],
    );
  }
}
