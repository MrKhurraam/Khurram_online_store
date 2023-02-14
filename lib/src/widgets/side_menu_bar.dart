import 'package:flutter/material.dart';
import 'package:khurram_store/src/helpers/app_colors.dart';
import 'package:khurram_store/src/services/login_service.dart';
import 'package:khurram_store/src/widgets/icon_font.dart';
import 'package:provider/provider.dart';

import '../helpers/icon_helper.dart';

class SideMenuBar extends StatelessWidget {
  const SideMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginService = Provider.of<LoginService>(context, listen: false);
    bool userLoggedIn = loginService.loggedInUserModel != null;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        color: AppColors.MAIN_COLOR,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
                onPressed: () async {
                  if (userLoggedIn) {
                    await loginService.signOut();
                    Navigator.of(context).pushNamed('/welcomepage');
                  } else {
                    bool success = await loginService.signInWithGoogle();
                    if (success) {
                      Navigator.of(context).pushNamed('/categorylistpage');
                    }
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      userLoggedIn ? Icons.logout : Icons.login,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      userLoggedIn ? "Sign Out" : 'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                )),
            IconFont(
              iconName: IconFontHelper.MAIN_LOGO,
              size: 70,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
