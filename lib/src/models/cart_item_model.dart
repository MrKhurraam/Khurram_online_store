import 'package:khurram_store/src/models/sub_category_model.dart';

import 'category_model.dart';

class CartItem {
  SubCategory subCategory;
  int units;

  CartItem({required this.subCategory, this.units = 0 });

}