import 'package:flutter/material.dart';

class ScrollableWidget extends StatelessWidget {
  const ScrollableWidget({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: child,
        ),
      );
}
