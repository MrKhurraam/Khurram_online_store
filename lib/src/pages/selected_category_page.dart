import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category_model.dart';
import '../services/category_selection_Service.dart';
import '../widgets/category_icon.dart';
import '../widgets/main_app_bar.dart';

class SelectedCategoryPage extends StatelessWidget {
  SelectedCategoryPage({Key? key}) : super(key: key);

  late Category selectedCategory;

  @override
  Widget build(BuildContext context) {
    final catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    selectedCategory = catSelection.selectedCategory;
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
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
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
                        catSelection.selectedSubCategory =
                            this.selectedCategory.subCategories![index];
                        Navigator.of(context).pushNamed('/detailspage');
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
                              '${this.selectedCategory.subCategories![index].name}',
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
