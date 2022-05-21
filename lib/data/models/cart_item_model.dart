import 'package:springy_shopp/data/models/product_model.dart';

class CartItemModel {
  Product product;
  int count;

  CartItemModel({required this.product, required this.count});

  factory CartItemModel.fromProduct(Product product) =>
      CartItemModel(product: product, count: 0);
}
