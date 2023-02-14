import 'package:flutter/material.dart';
import 'package:khurram_store/src/services/cart_service.dart';
import 'package:provider/provider.dart';

import '../helpers/app_colors.dart';

class CategoryBottomBar extends StatelessWidget {
  const CategoryBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.9),
          offset: Offset.zero,
          blurRadius: 20,
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
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
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
                  onTap: () {},
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
                                cart.items.length.toString(), style: TextStyle(
                                fontSize: 15, color: AppColors.MAIN_COLOR,
                              ),),
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
                onPressed: () {},
                icon: Icon(
                  Icons.pin_drop,
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
                onPressed: () {},
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
