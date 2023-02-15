import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/category_model.dart';

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
      log("categoriesData len= ${categoriesData
          .length} ,\n categoriesData = ${categoriesData}");

      categoriesData.forEach((key, value) {
        print("key = $key");
        Category cat = Category.fromJson(value);
        _categories.add(cat);
      });
    }

    log("_categories = ${_categories}");
  }
}
