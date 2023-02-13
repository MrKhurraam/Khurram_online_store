import 'dart:ui';

import 'category_model.dart';
import 'category_part_model.dart';

class SubCategory extends Category {
  List<CategoryPart> parts;

  SubCategory({
    required this.parts,
    required String name,
    required String icon,
    required Color color,
    required String imgName})
      : super(name: name, icon: icon, color: color, imgName: imgName);
}
