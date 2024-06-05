import 'package:virtual_cues/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    this.hasLeadingIcon,
    this.leadingIcon,
    this.leadingIconColor,
    this.iconBackgroundColor,
    this.trailing,
    this.data,
    this.onTap,
    this.padding,
    this.color,
    this.height,
    this.title,
    this.description,
  });

  final bool? hasLeadingIcon;
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final Color? iconBackgroundColor;
  final Widget? trailing;
  final Widget? description;
  final Widget? data;
  final Color? color;
  final EdgeInsets? padding;
  final double? height;
  final String? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: height,
          padding:
              padding ?? EdgeInsets.symmetric(vertical: 12.r, horizontal: 16.r),
          decoration: BoxDecoration(
            color: color ?? Colors.white.withOpacity(0.8),
            border: Border(
              bottom: BorderSide(
                color: const Color(
                  CUES_Colors.primary,
                ).withOpacity(0.2),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (hasLeadingIcon ?? false)
                Padding(
                  padding: EdgeInsets.only(right: 16.r),
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: iconBackgroundColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      leadingIcon,
                      color: leadingIconColor ?? Colors.white,
                      size: 16.sp,
                    ),
                  ),
                )
              else
                const SizedBox(),
              Expanded(
                flex: 5,
                child: title != null
                    ? Text(
                        title ?? '',
                        style: appTheme.textTheme.bodyLarge,
                      )
                    : description ?? const SizedBox(),
              ),
              if (data != null)
                Expanded(
                  flex: 6,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: data ?? const SizedBox(),
                  ),
                )
              else
                const SizedBox(),
              if (trailing != null)
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: trailing,
                  ),
                )
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
