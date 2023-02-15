import 'package:flutter/material.dart';

class IconFont extends StatelessWidget {
  IconFont({Key? key, this.color, this.size, this.iconName}) : super(key: key);
  Color? color;
  double? size;
  String? iconName;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      '${this.iconName}',
      color: this.color,
      height: this.size,
    );

    // Text('${this.iconName}',
    // style: TextStyle(
    //     color: this.color,
    //     fontSize: this.size,
    //     fontFamily: 'orillo'
    // ),);
  }
}
