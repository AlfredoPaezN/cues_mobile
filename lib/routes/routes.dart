import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:virtual_cues/modules/presentation/screens/app_navigation/appbar_view.dart';
import 'package:virtual_cues/modules/presentation/screens/auth/forgot_pass_screen.dart';
import 'package:virtual_cues/modules/presentation/screens/auth/login_screen.dart';
import 'package:virtual_cues/routes/routes_constants.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        name: Routes.home,
        path: '/app',
        pageBuilder: (context, state) {
          return CustomSlideTransition(
            key: state.pageKey,
            child: const AppNavigationView(),
          );
        },
      ),
      GoRoute(
        name: Routes.login,
        path: '/',
        pageBuilder: (_, state) {
          return CustomSlideTransition(
            key: state.pageKey,
            child: const Login(),
          );
        },
      ),
      GoRoute(
        name: Routes.register,
        path: '/register',
        pageBuilder: (_, state) {
          return CustomSlideTransition(
            key: state.pageKey,
            child: const Register(),
          );
        },
      ),

      // GoRoute(
      //   name: MyAppRouteConstants.contactUsRouteName,
      //   path: '/contact_us',
      //   pageBuilder: (context, state) {
      //     return MaterialPage(child: ContactUS());
      //   },
      // )
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(key: state.pageKey, child: const Login());
    },
  );
  GoRouter get router => _router;
}

class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({required super.child, super.key})
      : super(
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1.5, 0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.ease),
                ),
              ),
              child: child,
            );
          },
        );
}
