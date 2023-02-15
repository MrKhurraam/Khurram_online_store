import 'dart:ui';

import 'sub_category_model.dart';

class Category {
  String name, icon, imgName;
  Color color;
  List<SubCategory>? subCategories;

  Category({required this.color,
    required this.name,
    required this.icon,
    required this.imgName,
    this.subCategories});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon,
      'imgName': imgName,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        color: Color(int.parse('0xFF' + json['color'])),
        icon: json['icon'],
        name: json['name'],
        imgName: json['imgName'],
        subCategories: SubCategory.fromJsonArray(json['subCategories'])
    );
  }
}
