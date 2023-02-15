import 'dart:ui';

import '../helpers/unitenums.dart';
import 'category_model.dart';
import 'category_part_model.dart';

class SubCategory extends Category {
  List<CategoryPart> parts;
  double price;
  WeightUnits unit;
  int amount;

  double getTotalPrice() {
    return this.amount * this.price;
  }

  SubCategory(
      {this.parts = const [],
      this.price = 15.0,
      this.unit = WeightUnits.Lb,
      this.amount = 0,
      required String name,
      required String icon,
      required Color color,
      required String imgName})
      : super(name: name, icon: icon, color: color, imgName: imgName);

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
        amount: 0,
        unit: WeightUnits.Lb,
        name: json['name'],
        imgName: json['imgName'],
        color: Color(int.parse('0xFF' + json['color'])),
        icon: json['icon'],
        price: double.parse(json['price']),
        parts: CategoryPart.fromJsonArray(json['parts']));
  }

  static List<SubCategory> fromJsonArray(List<dynamic> jsonArray) {
    List<SubCategory> subCategoriesFromJson = [];

    jsonArray.forEach((jsonData) {
      subCategoriesFromJson.add(SubCategory.fromJson(jsonData));
    });

    return subCategoriesFromJson;
  }
}
