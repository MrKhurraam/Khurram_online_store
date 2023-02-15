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

  Map<String, dynamic> toMap() {
    var myMapp = [];
    int i = 0;
    subCategories?.forEach((element) {
      myMapp.add(element.toMap());
      i++;
    });

    return {
      'name': name,
      'icon': '$icon',
      'imgName': imgName,
      'color': color.value,
      'subCategories': myMapp,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    print("inside ${Category.fromJson}");
    return Category(
        color: Color(json['color']),
        icon: json['icon'],
        name: json['name'],
        imgName: json['imgName'],
        subCategories: SubCategory.fromJsonArray(json['subCategories']));
  }
}
