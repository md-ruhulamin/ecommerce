import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/constrains/constants.dart';
import 'package:eshop/model/product_models.dart';
import 'package:flutter/foundation.dart';

class FirebaseFirestoreHelper {
  static FirebaseFirestoreHelper instance = FirebaseFirestoreHelper();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<Product>> getCategories() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseFirestore.collection("categories").get();
      List<Product> productlist =
          querySnapshot.docs.map((e) => Product.fromJson(e.data())).toList();
      return productlist;
    } catch (e) {
      showMessage(e.toString());
      return [];
    }
  }
}
