import 'package:virtual_cues/routes/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CuesDrawerView extends StatefulWidget {
  const CuesDrawerView({super.key});

  @override
  State<CuesDrawerView> createState() => _CuesDrawerViewState();
}

class _CuesDrawerViewState extends State<CuesDrawerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FloatingActionButton(
          onPressed: () {
            context.pushReplacement(Routes.login);
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
