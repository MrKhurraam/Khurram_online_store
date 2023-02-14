import 'package:flutter/material.dart';

import '../models/category_part_model.dart';
import '../models/sub_category_model.dart';

class CategoryPartList extends StatefulWidget {
  CategoryPartList({Key? key, required this.subCategory}) : super(key: key);

  SubCategory subCategory;

  @override
  State<CategoryPartList> createState() => _CategoryPartListState();
}

class _CategoryPartListState extends State<CategoryPartList> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
          child: Text(
            'Select the part you want:',
            style: TextStyle(),
          ),
        ),
        Container(
          height: 170,
          child: ListView.builder(shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.subCategory.parts.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  widget.subCategory.parts.forEach((CategoryPart part) {
                    part.isSelected = widget.subCategory.parts[index] == part;
                  });
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        border: widget.subCategory.parts[index].isSelected
                            ? Border.all(
                                color: widget.subCategory.color, width: 7)
                            : null,
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/imgs/' +
                                widget.subCategory.parts[index].imgName +
                                '.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset.zero)
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text(
                      widget.subCategory.parts[index].name,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: widget.subCategory.color),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
