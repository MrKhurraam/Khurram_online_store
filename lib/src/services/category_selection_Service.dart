// this class will hold the currently selected category and subcategory

import 'package:flutter/cupertino.dart';

import '../models/category_model.dart';
import '../models/sub_category_model.dart';

class CategorySelectionService extends ChangeNotifier {
  late Category _selectedCategory;
  late SubCategory _selectedSubCategory;

  Category get selectedCategory => _selectedCategory;

  SubCategory get selectedSubCategory => _selectedSubCategory;

  set selectedCategory(Category value) {
    _selectedCategory = value;
  }

  set selectedSubCategory(SubCategory value) {
    _selectedSubCategory = value;
  }
}
