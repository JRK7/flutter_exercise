import 'package:flutter_exercise/Model/product_info.dart';

class CartItem {
  late bool shouldExpand;
  List<ProductInfo>? products;

  CartItem({required this.shouldExpand, this.products});
}
