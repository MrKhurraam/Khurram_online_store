import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:khurram_store/src/helpers/app_colors.dart';
import 'package:khurram_store/src/helpers/icon_helper.dart';
import 'package:khurram_store/src/helpers/utils.dart';
import 'package:khurram_store/src/models/sub_category_model.dart';
import 'package:khurram_store/src/services/cart_service.dart';
import 'package:khurram_store/src/services/login_service.dart';
import 'package:khurram_store/src/widgets/icon_font.dart';
import 'package:provider/provider.dart';

import '../models/cart_item_model.dart';

class ShoppingListPage extends StatelessWidget {
  const ShoppingListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartService cartService = Provider.of<CartService>(context, listen: false);
    cartService.loadCartItemFromFirebase(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 120),
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
                Expanded(
                  child: Text(
                    'Your Cart',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Consumer<CartService>(builder: (context, cart, child) {
                  if (cart.items.length > 0) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            cartService.removeAll(context);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              color: AppColors.MAIN_COLOR.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.delete,
                                  // size: 20,
                                  color: AppColors.DARK_GREEN,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Delete All",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.DARK_GREEN),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  return SizedBox.shrink();
                })
              ],
            ),
            Expanded(child: Consumer<CartService>(
              builder: (context, cart, child) {
                List<Widget> cartItems = [];
                double mainTotal = 0;

                if (cart.items.length > 0) {
                  cart.items.forEach(
                    (CartItem item) {
                      SubCategory itemSubCategory = (item.subCategory);
                      print("itemSubCategory = ${itemSubCategory.price}");
                      double total =
                          itemSubCategory.price * itemSubCategory.amount;
                      mainTotal += total;

                      cartItems.add(Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset.zero)
                          ],
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipOval(
                              child: Image.asset(
                                './assets/imgs/${itemSubCategory.imgName}.png',
                                fit: BoxFit.fill,
                                height: 50,
                                width: 50,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${itemSubCategory.name}",
                                  style:
                                      TextStyle(color: itemSubCategory.color),
                                ),
                                Text(
                                  "${itemSubCategory.amount} ${Utils.weightUnitToString(itemSubCategory.unit)}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "\S${total.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      color: itemSubCategory.color,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                            IconButton(
                                onPressed: () {
                                  cart.remove(context, item);
                                },
                                icon: Icon(
                                  Icons.highlight_off,
                                  size: 30,
                                  color: AppColors.MAIN_COLOR,
                                ))
                          ],
                        ),
                      ));
                    },
                  );

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(children: cartItems)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconFont(
                              color: AppColors.MAIN_COLOR,
                              iconName: IconFontHelper.LOGO,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text:
                                    'Total \$ ${mainTotal.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: AppColors.MAIN_COLOR,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              )
                            ])),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container(
                    // alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconFont(
                          color: Colors.grey[400],
                          iconName: IconFontHelper.LOGO,
                          size: 40,
                        ),
                        Container(
                          width: 2,
                          height: 80,
                          color: Colors.grey[400],
                          margin: EdgeInsets.only(left: 20, right: 20),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            "Your cart has no items, Add any!",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
