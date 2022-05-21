import 'package:dio/dio.dart';

import '../../models/product_model.dart';

class ProductRemoteDatasource {
  final Dio dio = Dio();

  Future<ProductModel> getProducts() async {
    try{
      final response = await dio.get("https://dummyjson.com/products");
      return ProductModel.fromMap(response.data);
    }catch(error){
      rethrow;
    }
  }
}
