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
    notifyListeners();
  }

  set selectedSubCategory(SubCategory value) {
    _selectedSubCategory = value;
    notifyListeners();
  }

  void incrementSubCategoryAmount() {
    if (_selectedSubCategory != null) {
      _selectedSubCategory.amount++;
      notifyListeners();
    }
  }

  void decrementSubCategoryAmount() {
    if (_selectedSubCategory != null) {
      _selectedSubCategory.amount--;
      notifyListeners();
    }
  }

  int get subCategoryAmount {
    int subCatAmount = 0;
    if (_selectedSubCategory != null) {
      subCatAmount = _selectedSubCategory.amount;
    }
    return subCatAmount;
  }
}
