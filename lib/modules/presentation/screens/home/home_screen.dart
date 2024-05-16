import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:virtual_cues/core/utils/colors.dart';
import 'package:virtual_cues/modules/presentation/widgets/circle_avatar.dart';
import 'package:virtual_cues/modules/presentation/widgets/grid_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: ListView(
          children: [
            SizedBox(height: 20.h),
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
              height: 100.h,
            ),
            SizedBox(height: 20.h),
            GridItem(
              leading: CustomCircleAvatar(
                radius: 20.r,
                child: const Icon(
                  Ionicons.calendar_outline,
                  size: 30,
                  color: Color(CUES_Colors.primary),
                ),
              ),
              title: 'Calendario de academico',
              onTap: () {
                _launchUrl(
                  Uri.parse(
                    'https://virtualcues.com/sat/logincues/img/CALENDARIO%20ACADEMICO%202024-1.pdf',
                  ),
                );
              },
            ),
            SizedBox(height: 10.h),
            GridItem(
              leading: CustomCircleAvatar(
                radius: 20.r,
                child: const Icon(
                  Ionicons.school_outline,
                  size: 30,
                  color: Color(CUES_Colors.primary),
                ),
              ),
              title: 'Calendario de grado',
              onTap: () {
                _launchUrl(
                  Uri.parse(
                    'https://virtualcues.com/sat/logincues/img/calendariogrado.pdf',
                  ),
                );
              },
            ),
            SizedBox(height: 10.h),
            GridItem(
              leading: CustomCircleAvatar(
                radius: 20.r,
                child: const Icon(
                  Icons.text_snippet_outlined,
                  size: 30,
                  color: Color(CUES_Colors.primary),
                ),
              ),
              title: 'Pruebas TyT y Saber Pro',
              onTap: () {
                _launchUrl(
                  Uri.parse(
                    'https://virtualcues.com/sat/logincues/img/CALENDARIO%20DE%20PRUEBAS%20SABER%202024-1.pdf',
                  ),
                );
              },
            ),
            SizedBox(height: 20.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: GestureDetector(
                onTap: () {
                  // Get.toNamed(Routes.VEHICLE_DETAIL);
                },
                child: Image.asset(
                  'assets/images/promo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
