import 'package:flutter/material.dart';
import 'package:khurram_store/src/helpers/app_colors.dart';
import 'package:khurram_store/src/services/login_service.dart';
import 'package:khurram_store/src/widgets/icon_font.dart';
import 'package:provider/provider.dart';

import '../helpers/dialogs.dart';
import '../helpers/icon_helper.dart';
import '../helpers/utils.dart';
import '../services/cart_service.dart';
import '../services/category_service.dart';

class SideMenuBar extends StatelessWidget {
  const SideMenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginService = Provider.of<LoginService>(context, listen: false);
    bool userLoggedIn = loginService.loggedInUserModel != null;
    CategoryService categoryService =
        Provider.of<CategoryService>(context, listen: false);
    CartService cartService = Provider.of<CartService>(context, listen: false);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        color: AppColors.MAIN_COLOR,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                TextButton(
                  onPressed: () async {
                    if (userLoggedIn) {
                      await loginService.signOut();
                      categoryService.resetCategoriesToDefaults();
                      cartService.clearCartItem();
                      Utils.mainAppNav.currentState!
                          .pushReplacementNamed('/welcomepage');
                    } else {
                      Dialogs.SHOW_LOADING_DIALOG(context, 'Signing in');
                      bool success = await loginService.signInWithGoogle();
                      Navigator.pop(context);
                      if (success) {
                        // Utils.mainAppNav.currentState!.pushNamed('/mainpage');
                        Navigator.pop(context);
                        Utils.mainListNav.currentState!
                            .pushReplacementNamed('/mainpage/categorylistpage');
                      } else {
                        Navigator.pop(context);
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
                  ),
                ),
                SizedBox(height: 10),
                Visibility(
                    visible: !userLoggedIn,
                    child: TextButton(
                        onPressed: () async {
                          Utils.mainAppNav.currentState!
                              .pushNamed('/welcomepage');
                        },
                        child: Row(
                          children: [
                            Icon(Icons.home, color: Colors.white, size: 20),
                            SizedBox(width: 10),
                            Text('Welcome',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))
                          ],
                        ))),
              ],
            ),
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
