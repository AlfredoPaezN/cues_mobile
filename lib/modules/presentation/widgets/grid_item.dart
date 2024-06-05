import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    this.leading,
    this.title,
    this.widgetTitle,
    this.subtitle,
    this.widgetSubtitle,
    this.trailing,
    this.isExpanded = false,
    this.expandedContent,
    this.onTap,
  });

  final Widget? leading;
  final String? title;
  final Widget? widgetTitle;
  final String? subtitle;
  final Widget? widgetSubtitle;
  final Widget? trailing;
  final bool isExpanded;
  final Widget? expandedContent;
  // ignore: inference_failure_on_function_return_type
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffeaeaea),
          ),
        ),
      ),
      child: Card(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.r,
                          horizontal: 16.r,
                        ),
                        child: leading ??
                            SizedBox(
                              height: 50.r,
                              width: 50.r,
                            ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widgetTitle ??
                              Text(
                                title ?? '',
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                style: appTheme.textTheme.titleMedium,
                              ),
                          SizedBox(height: 4.r),
                          widgetSubtitle ??
                              Text(
                                subtitle ?? '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: appTheme.textTheme.bodyLarge,
                              ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(0.r),
                    child: trailing ??
                        Container(
                          margin: EdgeInsets.only(right: 16.r),
                          child: Icon(
                            Ionicons.chevron_forward,
                            size: appTheme.iconTheme.size,
                          ),
                        ),
                  ),
                ],
              ),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 150),
                reverseDuration: const Duration(milliseconds: 1500),
                firstCurve: Curves.bounceIn,
                secondCurve: Curves.bounceIn,
                firstChild: const SizedBox(),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                secondChild: IntrinsicHeight(
                  child: expandedContent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
