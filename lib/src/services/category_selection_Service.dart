// this class will hold the currently selected category and subcategory

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:khurram_store/src/helpers/dialogs.dart';
import 'package:khurram_store/src/services/cart_service.dart';
import 'package:provider/provider.dart';

import '../models/category_model.dart';
import '../models/sub_category_model.dart';
import 'login_service.dart';

class CategorySelectionService extends ChangeNotifier {
  Category? _selectedCategory;
  SubCategory? _selectedSubCategory;

  Category? get selectedCategory => _selectedCategory;

  SubCategory? get selectedSubCategory => _selectedSubCategory;

  set selectedCategory(Category? value) {
    _selectedCategory = value;
    notifyListeners();
  }

  set selectedSubCategory(SubCategory? value) {
    _selectedSubCategory = value;
    notifyListeners();
  }

  void incrementSubCategoryAmount(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    CartService cartService = Provider.of<CartService>(context, listen: false);

    if (cartService.isSubCategoryAddedToCart(_selectedSubCategory!)) {
      Dialogs.SHOW_LOADING_DIALOG(context, 'Adding One Item');
      FirebaseFirestore.instance
          .collection('shoppers')
          .doc('${loginService.loggedInUserModel!.uid}')
          .update({
        'cartItems.${_selectedSubCategory?.imgName}': FieldValue.increment(1)
      }).then((value) {
        _selectedSubCategory?.amount++;
        Navigator.pop(context);
        notifyListeners();
      });
    } else {
      _selectedSubCategory?.amount++;
      notifyListeners();
    }
  }

  void decrementSubCategoryAmount(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    CartService cartService = Provider.of<CartService>(context, listen: false);

    if (cartService.isSubCategoryAddedToCart(_selectedSubCategory!)) {
      Dialogs.SHOW_LOADING_DIALOG(context, 'Removing Item');
      FirebaseFirestore.instance
          .collection('shoppers')
          .doc('${loginService.loggedInUserModel!.uid}')
          .update({
        'cartItems.${_selectedSubCategory!.imgName}': FieldValue.increment(-1)
      }).then((value) {
        _selectedSubCategory!.amount--;
        Navigator.pop(context);
        notifyListeners();
      });
    } else {
      _selectedSubCategory!.amount--;
      notifyListeners();
    }
  }

  int get subCategoryAmount {
    int subCatAmount = 0;
    if (_selectedSubCategory != null) {
      subCatAmount = _selectedSubCategory!.amount;
    }
    return subCatAmount;
  }

  double get totalCost => _selectedSubCategory!.getTotalPrice();
}
