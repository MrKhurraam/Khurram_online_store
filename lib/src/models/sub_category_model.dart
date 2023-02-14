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
// List<CategoryPart> parts;

//   SubCategory({
//     required this.parts,
//     required String name,
//     required String icon,
//     required Color color,
//     required String imgName})
//       : super(name: name, icon: icon, color: color, imgName: imgName);
}
