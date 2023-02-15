import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:khurram_store/src/models/sub_category_model.dart';

import '../models/cart_item_model.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  void add(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  bool isSubCategoryAddedToCart(SubCategory subCat) {
    return _items.length > 0
        ? _items.any((CartItem element) => element.category.name == subCat.name)
        : false;
  }

  void remove(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  getCategoryFromCart(SubCategory cat) {
    SubCategory? subCat = cat;
    if (_items.length > 0 &&
        _items.any((CartItem item) => item.category.name == cat.name)) {
      CartItem cartItem =
          _items.firstWhere((CartItem item) => item.category.name == cat.name);
      if (cartItem != null) {
        subCat = cartItem.category as SubCategory?;
      }
    }
    return subCat;
  }
}
