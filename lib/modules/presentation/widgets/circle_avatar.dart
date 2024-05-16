import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    required this.radius,
    super.key,
    this.borderRadius,
    this.child,
  });

  final double radius;
  final Widget? child;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 50.r),
        child: child ?? const SizedBox(),
      ),
    );
  }
}
