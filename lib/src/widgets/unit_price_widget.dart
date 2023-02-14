import 'package:flutter/material.dart';
import 'package:khurram_store/src/models/sub_category_model.dart';
import 'package:khurram_store/src/services/category_selection_Service.dart';
import 'package:provider/provider.dart';

import '../helpers/app_colors.dart';
import '../helpers/unitenums.dart';
import '../helpers/utils.dart';

const int MAX_VALUE = 20;
const int MIN_VALUE = 0;

class UnitPriceWidget extends StatefulWidget {
  UnitPriceWidget({
    Key? key,
    this.themeColor = AppColors.MAIN_COLOR,
  }) : super(key: key);
  int amount = 0;
  double price = 15.0;
  double cost = 0.0;
  late WeightUnits unit;
  Color themeColor;

  @override
  State<UnitPriceWidget> createState() => _UnitPriceWidgetState();
}

class _UnitPriceWidgetState extends State<UnitPriceWidget> {
  @override
  Widget build(BuildContext context) {
    final catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    SubCategory subCategory = catSelection.selectedSubCategory;
    widget.themeColor = subCategory.color;
    widget.price = subCategory.price;
    widget.unit = subCategory.unit;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text.rich(TextSpan(children: [
            TextSpan(text: 'Unidad'),
            TextSpan(
                text: '${Utils.weightUnitToString(widget.unit)}',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: '(max. 20)', style: TextStyle(fontSize: 12)),
          ])),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset.zero,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (catSelection.subCategoryAmount < MAX_VALUE) {
                    catSelection.incrementSubCategoryAmount();
                  } else {
                    print(
                        "catSelection.subCategoryAmount = ${catSelection.subCategoryAmount}");
                  }
                },
                // catSelection.subCategoryAmount < MAX_VALUE
                //     ? () {
                //   catSelection.incrementSubCategoryAmount();
                // }
                //     : null,
                child: Consumer<CategorySelectionService>(
                    builder: (context, cat, child) {
                  return Icon(
                    Icons.add_circle_outline,
                    size: 50,
                    color: cat.subCategoryAmount < MAX_VALUE
                        ? widget.themeColor
                        : widget.themeColor.withOpacity(0.2),
                  );
                }),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Consumer<CategorySelectionService>(
                      builder: (context, cat, child) {
                    return Center(
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: cat.subCategoryAmount.toString(),
                              style: TextStyle(fontSize: 40)),
                          TextSpan(
                              text: '${Utils.weightUnitToString(widget.unit)}',
                              style: TextStyle(fontSize: 20)),
                        ]),
                      ),
                    );
                  }),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (catSelection.subCategoryAmount > MIN_VALUE) {
                    catSelection.decrementSubCategoryAmount();
                  } else {
                    print(
                        "catSelection.subCategoryAmount = ${catSelection.subCategoryAmount}");
                  }
                },
                // catSelection.subCategoryAmount > MIN_VALUE
                //     ? () {
                //         catSelection.decrementSubCategoryAmount();
                //       }
                //     : null,
                child: Consumer<CategorySelectionService>(
                    builder: (context, cat, child) {
                  return Icon(
                    Icons.remove_circle_outline,
                    size: 50,
                    color: cat.subCategoryAmount > MIN_VALUE
                        ? Colors.grey
                        : Colors.grey.shade100,
                  );
                }),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10.0, right: 20, left: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: 'Precio: ',
                  ),
                  TextSpan(
                      text: '\$${widget.price} / lb',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ]),
              ),
              Text(
                '\$${widget.cost}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
