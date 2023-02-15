import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/sub_category_model.dart';
import '../services/category_selection_Service.dart';
import 'category_icon.dart';

class MapBottomPill extends StatelessWidget {
  MapBottomPill({Key? key}) : super(key: key);
  late SubCategory subCategory;

  @override
  Widget build(BuildContext context) {
    final catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    subCategory = catSelection.selectedSubCategory;

    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset.zero,
                  blurRadius: 10),
            ]),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/imgs/${this.subCategory.imgName}.png',
                          fit: BoxFit.cover,
                          height: 60,
                          width: 60,
                        ),
                      ),
                      Positioned(
                          bottom: -10,
                          right: -10,
                          child: CategoryIcon(
                            color: this.subCategory.color,
                            size: 20,
                            padding: 5,
                            iconName: this.subCategory.icon,
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${this.subCategory.name}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                              fontSize: 15),
                        ),
                        Text('Khurram Market Saddar RWP'),
                        Text(
                          'My Location',
                          style: TextStyle(
                            color: this.subCategory.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.location_pin,
                    color: this.subCategory.color,
                    size: 50,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage('assets/imgs/farmer.jpeg'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: this.subCategory.color,
                        width: 4,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mubashir',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Shop No 8, Near KFC Saddar'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
