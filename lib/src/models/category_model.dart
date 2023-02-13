import 'dart:ui';

import 'sub_category_model.dart';


class Category {
  String name, icon, imgName;
  Color color;
  List<SubCategory>? subCategories;

  Category(
      {required this.color,
      required this.name,
      required this.icon,
      required this.imgName,
      this.subCategories});
}
