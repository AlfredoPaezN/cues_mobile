import 'package:virtual_cues/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    required this.onPressed,
    super.key,
    this.buttonContent,
    this.textColor,
    this.buttonColor,
    this.text,
    this.enabled = true,
  });

  final Widget? buttonContent;
  final String? text;
  final Color? textColor;
  final Color? buttonColor;
  final bool enabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      height: 45.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          enableFeedback: enabled ? true : false,
          backgroundColor: buttonColor ??
              (enabled
                  ? const Color(CUES_Colors.primary)
                  : const Color(CUES_Colors.secondary)),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 2.h,
            horizontal: 2.w,
          ),
          splashFactory: enabled ? null : NoSplash.splashFactory,
        ),
        onPressed: enabled ? onPressed : null,
        child: buttonContent ??
            Text(
              text ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: appTheme.textTheme.titleLarge!.fontSize,
                fontWeight: FontWeight.bold,
                color: textColor ?? (enabled ? Colors.white : Colors.grey),
              ),
            ),
      ),
    );
  }
}
