import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khurram_store/src/services/category_selection_Service.dart';
import 'package:khurram_store/src/widgets/side_menu_bar.dart';
import 'package:provider/provider.dart';

import '../helpers/utils.dart';
import '../models/category_model.dart';
import '../widgets/category_card.dart';

class CategoryListPage extends StatelessWidget {
  CategoryListPage({Key? key}) : super(key: key);

  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    final catSelection =
        Provider.of<CategorySelectionService>(context, listen: false);
    return Scaffold(
      drawer: Drawer(
        child: SideMenuBar(),
      ),
      // appBar: MainAppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Select a category",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 110),
                itemCount: categories.length,
                itemBuilder: (BuildContext context, index) {
                  return CategoryCard(
                      onCardClick: () {
                        catSelection.selectedCategory = categories[index];
                        Utils.mainAppNav.currentState
                            ?.pushNamed('/selectedcategorypage');
                      },
                      category: categories[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
