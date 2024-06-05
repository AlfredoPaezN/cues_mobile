import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virtual_cues/core/utils/colors.dart';

class InfoCardTitle extends StatelessWidget {
  const InfoCardTitle({
    super.key,
    this.title,
    this.leftPadding,
  });

  final String? title;
  final double? leftPadding;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
        top: 12.0.h,
        bottom: 12.h,
        left: leftPadding ?? 16.w,
      ),
      child: Text(
        title ?? '',
        style: TextStyle(
          fontSize: appTheme.textTheme.bodyLarge!.fontSize,
          color: const Color(CUES_Colors.gray),
        ),
      ),
    );
  }
}
