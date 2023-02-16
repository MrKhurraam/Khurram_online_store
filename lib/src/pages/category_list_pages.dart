import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khurram_store/src/services/category_selection_Service.dart';
import 'package:khurram_store/src/services/category_service.dart';
import 'package:khurram_store/src/widgets/side_menu_bar.dart';
import 'package:provider/provider.dart';

import '../helpers/utils.dart';
import '../models/category_model.dart';
import '../widgets/category_card.dart';
import '../widgets/main_app_bar.dart';

class CategoryListPage extends StatelessWidget {
  CategoryListPage({Key? key}) : super(key: key);

  // fetching static data
  // List<Category> categories = Utils.getMockedCategories();

  // now data from firebase
  List<Category> categories = [];

  @override
  Widget build(BuildContext context) {
    CategorySelectionService catSelection =
    Provider.of<CategorySelectionService>(context, listen: false);
    CategoryService catService =
    Provider.of<CategoryService>(context, listen: false);
    categories = catService.getCategories();

    return Scaffold(
      // drawer: Drawer(
      //   child: SideMenuBar(),
      // ),

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
