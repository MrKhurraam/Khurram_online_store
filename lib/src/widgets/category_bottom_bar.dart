import 'package:flutter/material.dart';
import 'package:khurram_store/src/services/cart_service.dart';
import 'package:provider/provider.dart';

import '../helpers/app_colors.dart';
import '../helpers/utils.dart';

class CategoryBottomBar extends StatelessWidget {
  const CategoryBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(color: Colors.white,
          // color: AppColors.MAIN_COLOR,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset.zero,
              blurRadius: 10,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
            child: Material(
              color: Colors.white,
              child: IconButton(
                splashColor: Colors.grey[100],
                highlightColor: Colors.grey[100],
                onPressed: () {
                  Utils.mainListNav.currentState!
                      .pushReplacementNamed('/mainpage/categorylistpage');
                },
                icon: Icon(
                  Icons.list,
                  color: AppColors.MAIN_COLOR,
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Material(
              color: Colors.white,
              child: InkWell(
                  splashColor: Colors.grey[100],
                  highlightColor: Colors.grey[100],
                  onTap: () {
                    Utils.mainListNav.currentState!
                        .pushReplacementNamed('/mainpage/shoppinglistpage');
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child:
                        Consumer<CartService>(builder: (context, cart, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: AppColors.MAIN_COLOR,
                          ),
                          Visibility(
                            visible: cart.items.length > 0,
                            child: Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                cart.items.length.toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColors.MAIN_COLOR,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  )),
            ),
          ),
          ClipOval(
            child: Material(
              color: Colors.white,
              child: IconButton(
                splashColor: Colors.grey[100],
                highlightColor: Colors.grey[100],
                onPressed: () {
                  Utils.mainListNav.currentState!
                      .pushReplacementNamed('/mainpage/favoritespage');
                },
                icon: Icon(
                  Icons.favorite,
                  color: AppColors.MAIN_COLOR,
                ),
              ),
            ),
          ),
          ClipOval(
            child: Material(
              color: Colors.white,
              child: IconButton(
                splashColor: Colors.grey[100],
                highlightColor: Colors.grey[100],
                onPressed: () {
                  Utils.mainListNav.currentState!
                      .pushReplacementNamed('/mainpage/settingpage');
                },
                icon: Icon(
                  Icons.settings,
                  color: AppColors.MAIN_COLOR,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
