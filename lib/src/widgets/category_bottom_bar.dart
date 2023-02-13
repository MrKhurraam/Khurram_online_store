import 'package:flutter/material.dart';

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
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: AppColors.MAIN_COLOR,
                ),
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: AppColors.MAIN_COLOR,
                ),
              ),
            ),
          ),
          ClipOval(
            child: Material(
              child: IconButton(
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
              child: IconButton(
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
