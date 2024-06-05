import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:virtual_cues/core/utils/colors.dart';
import 'package:virtual_cues/modules/presentation/widgets/circle_avatar.dart';
import 'package:virtual_cues/modules/presentation/widgets/info_card.dart';
import 'package:virtual_cues/modules/presentation/widgets/photo_fullscreen.dart';
import 'package:virtual_cues/modules/presentation/widgets/title_info_card.dart';
import 'package:flutter/material.dart';
import 'package:virtual_cues/modules/presentation/widgets/toasts.dart';
import 'package:virtual_cues/routes/routes_constants.dart';

class CuesDrawerView extends StatefulWidget {
  const CuesDrawerView({super.key});

  @override
  State<CuesDrawerView> createState() => _CuesDrawerViewState();
}

class _CuesDrawerViewState extends State<CuesDrawerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Estudiante'),
        centerTitle: true,
        flexibleSpace: Container(
          height: 200.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(CUES_Colors.primary), Colors.blue],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        elevation: 20,
        titleSpacing: 20,
      ),
      backgroundColor: const Color(CUES_Colors.backgroundColor),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            delegate: _PersistentHeader(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const InfoCardTitle(
                  title: 'INFORMATION',
                ),
                InfoCard(
                  description: const _CardTitle(title: 'Nombre'),
                  data: Text(
                    'Junior Paez',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                InfoCard(
                  description: const _CardTitle(title: 'Correo'),
                  data: Text(
                    'apaez7039@educues.com',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(CUES_Colors.gray),
                    ),
                  ),
                ),
                InfoCard(
                  description: const _CardTitle(title: 'Carrera'),
                  data: Text(
                    'Desarrollo de Software',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(CUES_Colors.gray),
                    ),
                  ),
                ),
                InfoCard(
                  description: const _CardTitle(title: 'Teléfono'),
                  data: Text(
                    '310 469 5545',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(CUES_Colors.gray),
                    ),
                  ),
                ),
                InfoCard(
                  description: const _CardTitle(title: 'Semestre'),
                  data: Text(
                    'Sexto (6)',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(CUES_Colors.gray),
                    ),
                  ),
                ),
                const InfoCardTitle(title: 'ACTIONS'),
                InfoCard(
                  description: const _CardTitle(title: 'Change password'),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14.sp,
                    color: Colors.black,
                  ),
                  onTap: () async {},
                ),
                InfoCard(
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14.sp,
                    color: Colors.black,
                  ),
                  description: const _CardTitle(title: 'Edit profile'),
                  onTap: () async => {},
                ),
                const InfoCardTitle(title: 'SESSION'),
                InfoCard(
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14.sp,
                    color: Colors.black,
                  ),
                  description: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(CUES_Colors.secondary),
                    ),
                  ),
                  onTap: () {
                    successToast(context, 'Logout successful');
                    context.push(Routes.login);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return Text(
      title,
      style: appTheme.textTheme.bodyLarge,
    );
  }
}

class _UserProfileImage extends StatelessWidget {
  const _UserProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => imageFullScreen(
        title: 'TITLE 91',
        image: Image.network(
          'https://static.vecteezy.com/system/resources/previews/007/381/530/non_2x/student-icon-school-and-education-icon-vector.jpg',
        ).image,
        tag: 12351352,
        context: context,
      ),
      child: Hero(
        tag: 12351352,
        child: CustomCircleAvatar(
          radius: 100.r,
          borderRadius: 80.r,
          child: Image.network(
            'https://static.vecteezy.com/system/resources/previews/007/381/530/non_2x/student-icon-school-and-education-icon-vector.jpg',
          ),
        ),
      ),
    );
  }
}

class _PersistentHeader extends SliverPersistentHeaderDelegate {
  _PersistentHeader();

  double minHeaderExtend = 50.h;
  double maxHeaderExtent = 200.h;

  @override
  double get maxExtent => maxHeaderExtent;

  @override
  double get minExtent => minHeaderExtend;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        // child: Hero(
        //   tag: controller.authController.user.value!.imageId!,
        //   child: Column(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _UserProfileImage(),
            Gap(8.r),
            const _UserName(),
            Gap(8.r),
            // Text(
            //   "Free Member",
            //   style: TextStyle(
            //     fontWeight: FontWeight.w300,
            //     fontSize: 12.sp,
            //     color: const Color(EyerideGColors.greyDark),
            //   ),
            // ),
          ],
        ),
        // ),
      ),
    );
  }
}

class _UserName extends StatelessWidget {
  const _UserName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return Text(
      'Junior Paez',
      textAlign: TextAlign.center,
      style: appTheme.textTheme.displayLarge,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
