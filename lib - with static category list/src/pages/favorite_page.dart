import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:khurram_store/src/helpers/app_colors.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: AppColors.MAIN_COLOR,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Favourite',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
