import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/app_colors.dart';
import '../helpers/icon_helper.dart';
import '../helpers/utils.dart';
import '../services/category_service.dart';
import '../widgets/icon_font.dart';

class SplashPage extends StatefulWidget {
  int duration = 3;
  String goToPage;

  SplashPage({
    required this.duration,
    required this.goToPage,
    Key? key,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  callFirebase() {
    var categoryService = Provider.of<CategoryService>(context, listen: false);

    Future.delayed(Duration(seconds: this.widget.duration), () async {
      FirebaseApp app = await Firebase.initializeApp();
      // Utils.mainAppNav.currentState!.pushNamed(widget.goToPage);

      categoryService.getCategoriesCollectionFromFirebase().then((value) {
        Utils.mainAppNav.currentState!.pushNamed(widget.goToPage);
      }).onError((error, stackTrace) {
        print("error = $error");
      });
    });
  }

  late AnimationController controller;

  // @override
  // void initState() {
  //   callFirebase();
  //   super.initState();
  // }

  @override
  void initState() {
    callFirebase();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.MAIN_COLOR,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: IconFont(
              color: Colors.white,
              iconName: IconFontHelper.LOGO,
              size: 80,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 150,
              width: 150,
              // child: CircularProgressIndicator(
              //   strokeWidth: 10,
              //   color: Colors.white,
              // ),
              child: CircularProgressIndicator(
                value: controller.value,
                strokeWidth: 10,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
