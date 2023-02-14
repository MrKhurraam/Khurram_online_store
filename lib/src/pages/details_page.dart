import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khurram_store/src/models/cart_item_model.dart';
import 'package:khurram_store/src/services/cart_service.dart';
import 'package:provider/provider.dart';

import '../helpers/app_colors.dart';
import '../models/sub_category_model.dart';
import '../services/category_selection_Service.dart';
import '../widgets/category_icon.dart';
import '../widgets/category_parts_list.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/theme_button.dart';
import '../widgets/unit_price_widget.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({
    Key? key,
  }) : super(key: key);

  late SubCategory subCategory;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    widget.subCategory = catSelection.selectedSubCategory;

    final cartService = Provider.of<CartService>(context, listen: false);

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              child: Stack(
                children: [
                  Container(
                    height: 0.35 * h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/imgs/' +
                              widget.subCategory.imgName +
                              '_desc.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                          ])),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CategoryIcon(
                            color: widget.subCategory.color,
                            iconName: widget.subCategory.icon,
                            size: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Pork Meat',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: widget.subCategory.color,
                                ),
                                child: Text(
                                  '\$50.00 / lb',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 110,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        color: AppColors.MAIN_COLOR,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 20,
                            offset: Offset.zero,
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Consumer<CartService>(
                              builder: (context, cart, child) {
                            return Text(
                              '${cart.items.length}',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            );
                          }),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  MainAppBar(
                    themeColor: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                // fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CategoryPartList(subCategory: widget.subCategory),
                    UnitPriceWidget(),
                    Consumer<CartService>(
                      builder: (context, cart, child) {
                        Widget renderedButton;

                        if (!cart
                            .isSubCategoryAddedToCart(widget.subCategory)) {
                          renderedButton = ThemeButton(
                            label: 'Add to Cart',
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            onClick: () {
                              cartService.add(
                                CartItem(category: widget.subCategory),
                              );
                            },
                          );
                        } else {
                          renderedButton = Container(
                            padding: EdgeInsets.all(26),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Added to Cart",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.MAIN_COLOR,
                                  ),
                                ),
                                Icon(
                                  Icons.check_circle,
                                  size: 30,
                                  color: AppColors.MAIN_COLOR,
                                ),
                              ],
                            ),
                          );
                        }
                        return renderedButton;
                      },
                    ),
                    // ThemeButton(
                    //   onClick: () {
                    //     cartService.add(CartItem(category: widget.subCategory));
                    //   },
                    //   highlight: AppColors.MAIN_COLOR,
                    //   label: 'Add to Cart',
                    //   icon: Icon(
                    //     Icons.shopping_cart,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    ThemeButton(
                      onClick: () {
                        Navigator.of(context).pushNamed('/mappage');
                      },
                      label: 'Product Location',
                      icon: Icon(
                        Icons.location_pin,
                        color: Colors.white,
                      ),
                      color: AppColors.DARK_GREEN,
                      highlight: AppColors.DARKER_GREEN,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
