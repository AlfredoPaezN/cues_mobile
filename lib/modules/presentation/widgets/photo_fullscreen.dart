import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void imageFullScreen({
  required Object tag,
  required BuildContext context,
  String? title,
  final ImageProvider? image,
}) {
  Navigator.of(context).push(
    PageRouteBuilder(
      settings: const RouteSettings(),
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        if (animation.status == AnimationStatus.reverse) {
          return FadeInUp(
            child: child,
          );
        } else {
          return FadeOutDown(child: child);
        }
      },
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return Scaffold(
          // appBar: CustomAppBar(
          //   leading: Padding(
          //     padding: EdgeInsets.only(left: 16.r),
          //     child: FittedBox(
          //       fit: BoxFit.none,
          //       child: CustomTextButton(
          //         onTap: Get.back,
          //         text: 'Close',
          //       ),
          //     ),
          //   ),
          //   title: Text(
          //     title ?? '',
          //     style: appTheme.textTheme.titleLarge,
          //   ),
          // ),
          body: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy < -10) {
                context.pop();
              }
            },
            child: ColoredBox(
              color: Colors.white,
              child: Center(
                child: SizedBox(
                  width: 1.sw,
                  child: Hero(
                    // tag: 'fullScreenTarget',
                    tag: tag,
                    child: Image(
                      image: image!,
                      fit: BoxFit.fill,
                      gaplessPlayback: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
