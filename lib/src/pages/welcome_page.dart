import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/app_colors.dart';
import '../helpers/icon_helper.dart';
import '../services/login_service.dart';
import '../widgets/icon_font.dart';
import '../widgets/theme_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginService = Provider.of<LoginService>(context, listen: false);

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/imgs/of_main_bg.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: ClipOval(
                      child: Container(
                        width: 180,
                        height: 180,
                        color: AppColors.MAIN_COLOR,
                        alignment: Alignment.center,
                        child: IconFont(
                          iconName: IconFontHelper.MAIN_LOGO,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Welcome',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Fresh Products \nAvailable at any time',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ThemeButton(
                    onClick: () {
                      Navigator.of(context).pushNamed('/categorylistpage');
                    },
                    label: 'Try Now',
                    color: AppColors.MAIN_COLOR,
                    highlight: Colors.green[900],
                  ),
                  ThemeButton(

                    label: 'Onboarding',
                    color: AppColors.DARK_GREEN,
                    highlight: Colors.green[900],
                    onClick: () {
                      Navigator.of(context).pushNamed('/onboardingpage');
                    },
                  ),
                  ThemeButton(
                    label: 'Login',
                    labelColor: AppColors.MAIN_COLOR,
                    color: Colors.transparent,
                    highlight: AppColors.MAIN_COLOR.withOpacity(0.5),
                    borderColor: AppColors.MAIN_COLOR,
                    borderWidth: 4,
                    onClick: () async {
                      bool success = await loginService.signInWithGoogle();
                      if (success) {
                        Navigator.of(context).pushNamed('/categorylistpage');
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
