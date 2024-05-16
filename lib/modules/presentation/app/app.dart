import 'package:virtual_cues/core/utils/colors.dart';
import 'package:virtual_cues/modules/presentation/blocs/auth/auth_cubit.dart';
import 'package:virtual_cues/modules/presentation/widgets/background.dart';
import 'package:virtual_cues/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hot_toast/flutter_hot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: GlobalLoaderOverlay(
        overlayWholeScreen: false,
        child: ScreenUtilInit(
          minTextAdapt: true,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: GoogleFonts.poppins().fontFamily,
              brightness: Brightness.light,
              unselectedWidgetColor: const Color(CUES_Colors.primary),
              colorScheme: const ColorScheme.light(
                primary: Color(CUES_Colors.primary),
                secondary: Color(CUES_Colors.secondary),
                background: Colors.transparent,
              ),
            ),
            routeInformationParser: AppRouter().router.routeInformationParser,
            routeInformationProvider:
                AppRouter().router.routeInformationProvider,
            routerDelegate: AppRouter().router.routerDelegate,
            builder: (context, child) {
              return Background(child: child!);
            },
          ),
        ),
      ),
    );
  }
}
