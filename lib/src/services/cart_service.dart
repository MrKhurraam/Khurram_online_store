import 'dart:collection';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:khurram_store/src/models/sub_category_model.dart';
import 'package:khurram_store/src/services/category_selection_Service.dart';
import 'package:khurram_store/src/services/category_service.dart';
import 'package:khurram_store/src/services/login_service.dart';
import 'package:provider/provider.dart';

import '../models/cart_item_model.dart';
import '../models/category_model.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  clearCartItem() {
    _items.forEach((CartItem item) {
      item.subCategory.amount = 0;
    });
    _items.clear();
    notifyListeners();
  }

  void add(BuildContext context, CartItem item) {
    _items.add(item);

    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    Map<String, int> cartMap = Map();
    // adding complete cart item to list for adding them to firestore
    _items.forEach((CartItem cartItem) {
      cartMap['${cartItem.subCategory.imgName}'] = (item.subCategory).amount;
    });

    // updating complete document in firestore.
    // set method only change that value which is different
    FirebaseFirestore.instance
        .collection('shoppers')
        .doc('${loginService.loggedInUserModel!.uid}')
        .set({'cartItems': cartMap}).then((value) {
      notifyListeners();
    });
  }

  bool isSubCategoryAddedToCart(SubCategory subCat) {
    return _items.length > 0
        ? _items
            .any((CartItem element) => element.subCategory.name == subCat.name)
        : false;
  }

  void remove(BuildContext context, CartItem item) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);

    SubCategory subCat = item.subCategory;

    FirebaseFirestore.instance
        .collection('shoppers')
        .doc('${loginService.loggedInUserModel!.uid}')
        .update({'cartItems.${subCat.imgName}': FieldValue.delete()}).then(
            (value) {
      item.subCategory.amount = 0;
      _items.remove(item);
      notifyListeners();
    });
  }

  void removeAll(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);

    FirebaseFirestore.instance
        .collection('shoppers')
        .doc('${loginService.loggedInUserModel!.uid}')
        .update({'cartItems': FieldValue.delete()}).then((value) {
      clearCartItem();
    });
  }

  getCategoryFromCart(SubCategory cat) {
    SubCategory? subCat = cat;
    if (_items.length > 0 &&
        _items.any((CartItem item) => item.subCategory.name == cat.name)) {
      CartItem cartItem = _items
          .firstWhere((CartItem item) => item.subCategory.name == cat.name);
      if (cartItem != null) {
        subCat = cartItem.subCategory;
      }
    }
    return subCat;
  }

  void loadCartItemFromFirebase(BuildContext context) {
    if (_items.length > 0) {
      _items.clear();
    }

    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    CategoryService categoryService =
        Provider.of<CategoryService>(context, listen: false);
    CategorySelectionService categorySelectionService =
        Provider.of<CategorySelectionService>(context, listen: false);

    if (loginService.isUserLoggedIn()) {
      FirebaseFirestore.instance
          .collection('shoppers')
          .doc('${loginService.loggedInUserModel!.uid}')
          .get()
          .then((DocumentSnapshot snapshot) {
        //get all the cart items of logged in user from document collection

        categoryService.getCategories().forEach((Category cat) {
          cat.subCategories!.forEach((SubCategory subCat) {
            // here we get each sub cat and compare it with cart item fetched from fire-store
            if (snapshot.exists) {
              Map<String, dynamic> cartItems =
                  snapshot.get(FieldPath(['cartItems']));

              if (cartItems.keys.contains(subCat.imgName)) {
                // i am getting count of this subcat which was added to firestore
                var amount = cartItems[subCat.imgName] as int;
                subCat.amount = amount;
                // Now the subcat is added to local list which contain all cart items
                _items.add(CartItem(subCategory: subCat));

                if (categorySelectionService.selectedSubCategory != null &&
                    categorySelectionService.selectedSubCategory.name ==
                        subCat.name) {
                  categorySelectionService.selectedSubCategory = subCat;
                }
              }
            }
          });
        });
        notifyListeners();
      });
    }
  }
}
