import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:khurram_store/src/services/cart_service.dart';
import 'package:provider/provider.dart';

import '../models/category_model.dart';
import '../models/category_part_model.dart';
import '../models/sub_category_model.dart';

class CategoryService extends ChangeNotifier {
  late FirebaseFirestore _instance;

  List<Category> _categories = [];

  List<Category> getCategories() {
    return _categories;
  }

  Future<void> getCategoriesCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;

    CollectionReference categories = _instance.collection('khurram_store');

    DocumentSnapshot snapshot = await categories.doc('categories').get();
    var data = snapshot.data() as Map<String, dynamic>;
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      var categoriesData = data['categories'] as Map<String, dynamic>;
     
      categoriesData.forEach((key, value) {
        Category cat = Category.fromJson(value);
        _categories.add(cat);
      });
    }
  }

  void resetCategoriesToDefaults() {
    if (_categories.length > 0) {
      _categories.forEach((Category cat) {
        cat.subCategories!.forEach((SubCategory subCat) {
          subCat.parts.forEach((CategoryPart part) {
            part.isSelected = false;
          });

          subCat.amount = 0;
        });
      });

      notifyListeners();
    }
  }
}
