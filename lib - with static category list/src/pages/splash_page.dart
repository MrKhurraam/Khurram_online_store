import 'dart:async';

import 'package:flutter/material.dart';

import '../helpers/app_colors.dart';
import '../helpers/icon_helper.dart';
import '../widgets/icon_font.dart';

class SplashPage extends StatefulWidget {
  int duration = 3;
  Widget goToPage;

  SplashPage({
    required this.duration,
    required this.goToPage,
    Key? key,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: this.widget.duration), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => widget.goToPage),
      );
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.MAIN_COLOR,
        alignment: Alignment.center,
        child: IconFont(
          color: Colors.white,
          iconName: IconFontHelper.LOGO,
          size: 120,
        ),
      ),
    );
  }
}
