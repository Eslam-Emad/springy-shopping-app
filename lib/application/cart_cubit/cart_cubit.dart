import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:springy_shopp/data/models/cart_item_model.dart';
import 'package:springy_shopp/data/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(BuildContext context) => BlocProvider.of(context);
  List<CartItemModel> cartItems = [];

  addToCar(Product product) {
    final cartItem = CartItemModel.fromProduct(product);
    if (cartItems
        .where((element) => element.product.id == cartItem.product.id)
        .isEmpty) {
      cartItems.add(cartItem);
    }
  }

  incrementItem(int index) {
    emit(CartLoading());
    cartItems[index].count += 1;
    emit(CartItemIncremented());
  }

  decrementItem(int index) {
    if (cartItems[index].count > 0) {
      emit(CartLoading());
      cartItems[index].count -= 1;
      emit(CartItemDecremented());
    }
  }
}
