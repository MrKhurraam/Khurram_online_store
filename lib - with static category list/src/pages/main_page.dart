import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khurram_store/src/pages/category_list_pages.dart';
import 'package:khurram_store/src/pages/shopping_list_page.dart';
import 'package:khurram_store/src/services/category_selection_Service.dart';
import 'package:khurram_store/src/widgets/side_menu_bar.dart';
import 'package:provider/provider.dart';

import '../helpers/utils.dart';
import '../widgets/category_bottom_bar.dart';
import '../widgets/main_app_bar.dart';
import 'favorite_page.dart';
import 'settings_page.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);

    return Scaffold(
      drawer: Drawer(
        child: SideMenuBar(),
      ),
      appBar: MainAppBar(),
      body: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Navigator(
                    key: Utils.mainListNav,
                    initialRoute: '/',
                    onGenerateRoute: (RouteSettings settings) {
                      Widget page;

                      switch (settings.name) {
                        case '/':
                          page = CategoryListPage();
                          break;
                        case '/mainpage/favoritespage':
                          page = FavoritesPage();
                          break;
                        case '/mainpage/shoppinglistpage':
                          page = ShoppingListPage();
                          break;
                        case '/mainpage/settingpage':
                          page = SettingsPage();
                          break;
                        default:
                          page = CategoryListPage();
                          break;
                      }

                      return PageRouteBuilder(
                        pageBuilder: (_, __, ___) => page,
                        transitionDuration: const Duration(seconds: 0),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 0, left: 0, right: 0, child: CategoryBottomBar()),
          ],
        ),
      ),
    );
  }
}
