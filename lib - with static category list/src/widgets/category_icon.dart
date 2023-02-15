import 'dart:ui';

import 'package:flutter/material.dart';

import 'icon_font.dart';

class CategoryIcon extends StatelessWidget {
  CategoryIcon({
    Key? key,
    required this.color,
    required this.iconName,
    this.size = 30,
    this.padding = 10,
  }) : super(key: key);
  Color color;
  String iconName;
  double? size;
  double padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Container(
          color: this.color,
          padding: EdgeInsets.all(this.padding),
          child: IconFont(
            color: Colors.white,
            iconName: this.iconName,
            size: this.size,

          ),
        ),
      ),
    );
  }
}
