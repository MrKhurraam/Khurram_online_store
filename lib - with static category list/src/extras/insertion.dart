import '../models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';
import 'package:flutter/material.dart';

class InsertionIntoFirebase {
  addNewUser(Category userModel) async {
    try {
      var response = await FirebaseFirestore.instance
          .collection('userslist')
          .add(userModel.toJson());
      print("Firebase response1111 ${response.id}");
      return response.id;
    } catch (e) {
      log("Exception occur : ${e}");
      throw Exception('Error in adding new user');
    }
  }

  CollectionReference users =
  FirebaseFirestore.instance.collection('khurram_store');

  Future<void> addUser() {
    return users
        .doc('categories')
        .set(

        {'full_name': "Mary Jane", 'age': 18}

    )
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
