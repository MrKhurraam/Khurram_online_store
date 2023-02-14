import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khurram_store/src/services/cart_service.dart';
import 'package:provider/provider.dart';

import '../helpers/app_colors.dart';
import '../helpers/utils.dart';
import '../models/cart_item_model.dart';
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
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: '${widget.subCategory.price}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' / ${Utils.weightUnitToString(widget.subCategory.unit)}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ])),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 140,
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<CartService>(
              builder: (context, cart, child) {
                Widget renderedButton;

                if (!cart.isSubCategoryAddedToCart(widget.subCategory)) {
                  renderedButton = Consumer<CategorySelectionService>(
                      builder: (context, cat, child) {
                    print(
                        "cat.selectedSubCategory.amount = ${cat.selectedSubCategory.amount}");
                    return ThemeButton(
                      bottomMargin: 10,
                      label: 'Add to Cart',
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onClick: () {
                        cat.selectedSubCategory.amount != 0
                            ? cartService.add(
                                CartItem(category: widget.subCategory),
                              )
                            : null;
                      },
                    );
                  });
                } else {
                  renderedButton = ThemeButton(
                    color: Colors.grey.shade100,
                    bottomMargin: 10,
                    highlight: Colors.grey[600],
                    labelColor: AppColors.MAIN_COLOR,
                    label: 'Added to Cart',
                    icon: Icon(
                      Icons.check_circle,
                      size: 25,
                      color: AppColors.MAIN_COLOR,
                    ),
                    onClick: () {},
                  );
                }
                return renderedButton;
              },
            ),
            ThemeButton(
              bottomMargin: 10,
              onClick: () {
                Utils.mainAppNav.currentState?.pushNamed('/mappage');
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
    );
  }
}
