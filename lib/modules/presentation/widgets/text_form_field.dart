import 'package:virtual_cues/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.controller,
    this.initialValue,
    this.onChanged,
    this.onTap,
    this.textInputType,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled,
    this.validator,
    this.inputFormatters,
    this.autofocus,
    this.readOnly = false,
    this.showCursor = true,
    this.obscureText = false,
    this.leftPadding,
    this.topPadding,
    this.rightPadding,
    this.bottomPadding,
    this.autovalidateMode,
    this.fillColor,
    super.key,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final void Function(String)? onChanged;
  final Function()? onTap;
  final TextInputType? textInputType;
  // final String? labelText;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enabled;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? autofocus;
  final bool readOnly;
  final bool showCursor;
  final bool obscureText;
  final double? leftPadding;
  final double? topPadding;
  final double? rightPadding;
  final double? bottomPadding;
  final AutovalidateMode? autovalidateMode;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPhoneMode = screenSize.width < 500;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Column(
            children: [
              Text(
                labelText!,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          keyboardType: textInputType,
          textAlignVertical: TextAlignVertical.center,
          onChanged: onChanged,
          onTap: onTap,
          validator: validator,
          inputFormatters: inputFormatters,
          enabled: enabled,
          autofocus: autofocus ?? false,
          cursorColor: const Color(CUES_Colors.primary),
          readOnly: readOnly,
          showCursor: showCursor,
          obscureText: obscureText,
          autovalidateMode: autovalidateMode,
          style: TextStyle(
            color: readOnly ? Colors.grey.shade400 : Colors.white,
            fontSize: 12.sp,
          ),
          decoration: InputDecoration(
            errorStyle: TextStyle(
              color: Colors.transparent,
              fontSize: 0.sp,
              height: 1,
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: isPhoneMode ? 12.h : 8.h,
              horizontal: isPhoneMode ? 12.w : 8.w,
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade300,
              fontSize: 14.sp,
              overflow: TextOverflow.ellipsis,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4.r),
              ),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
              borderSide: BorderSide(
                color: readOnly && validator == null
                    ? Colors.grey.shade300
                    : const Color(CUES_Colors.primary),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
              borderSide: const BorderSide(
                width: 0,
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
              borderSide: BorderSide(
                width: 1.2,
                color: readOnly
                    ? Colors.grey.shade300
                    : const Color(CUES_Colors.primary),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
