import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../widgets/category_icon.dart';
import '../widgets/main_app_bar.dart';
import 'details_page.dart';

class SelectedCategoryPage extends StatelessWidget {
  SelectedCategoryPage({Key? key, required this.selectedCategory})
      : super(key: key);

  Category selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryIcon(
                  color: this.selectedCategory.color,
                  iconName: this.selectedCategory.icon,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${this.selectedCategory.name}',
                  style: TextStyle(
                    color: this.selectedCategory.color,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  this.selectedCategory.subCategories!.length,
                      (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailsPage(subCategory:
                                  this.selectedCategory.subCategories![index])
                          ),
                        );
                      },
                      child: Container(
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/imgs/' +
                                    this
                                        .selectedCategory
                                        .subCategories![index]
                                        .imgName +
                                    '.png',
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${this.selectedCategory.subCategories![index]
                                  .name}',
                              style: TextStyle(
                                color: this.selectedCategory.color,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
