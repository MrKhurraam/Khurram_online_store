import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helpers/utils.dart';
import '../models/category_model.dart';
import '../widgets/category_bottom_bar.dart';
import '../widgets/category_card.dart';
import '../widgets/category_icon.dart';
import '../widgets/icon_font.dart';
import '../widgets/main_app_bar.dart';
import 'selected_category_page.dart';

class CategoryListPage extends StatelessWidget {
  CategoryListPage({Key? key}) : super(key: key);

  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: MainAppBar(),
      body: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Select a category",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 110),
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, index) {
                      return CategoryCard(
                          onCardClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectedCategoryPage(
                                  selectedCategory: this.categories[index],
                                ),
                              ),
                            );
                          },
                          category: categories[index]);
                    },
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 0, left: 0, right: 0, child: CategoryBottomBar()),
          ],
        ),
      ),
    );
  }
}
