import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/app_colors.dart';
import '../models/category_part_model.dart';
import '../models/sub_category_model.dart';
import '../widgets/category_icon.dart';
import '../widgets/category_parts_list.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/theme_button.dart';
import '../widgets/unit_price_widget.dart';
import 'map_page.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, required this.subCategory}) : super(key: key);

  SubCategory subCategory;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
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
                    height: 300,
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
                        children: [
                          CategoryIcon(
                            color: widget.subCategory.color,
                            iconName: widget.subCategory.icon,
                            size: 50,
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
                                padding: EdgeInsets.all(10),
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
                          left: 15, right: 15, top: 5, bottom: 8),
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
                        children: [
                          Text(
                            '3',
                            style: TextStyle(fontSize: 15, color: Colors.white),
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
                // fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CategoryPartList(subCategory: widget.subCategory),
                    UnitPriceWidget(),
                    ThemeButton(
                      onClick: () {},
                      highlight: AppColors.MAIN_COLOR,
                      label: 'Add to Cart',
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                    ThemeButton(
                      onClick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapPage(
                                      subCategory: widget.subCategory,
                                    )));
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
