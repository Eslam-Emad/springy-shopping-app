import 'package:bloc/bloc.dart';
import 'package:springy_shopp/data/datasources/remote/product_remote_datasource.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductRemoteDatasource productRemoteDatasource =
      ProductRemoteDatasource();

  HomeCubit() : super(HomeInitial());

  getProducts() async {
    emit(HomeLoading());
    try {
      final productsModel = await productRemoteDatasource.getProducts();
      emit(HomeLoaded(productsModel.products));
    } catch (error) {
      emit(HomeFailed(error));
    }
  }
}
