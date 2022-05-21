part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Product> products;

  const HomeLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class HomeFailed extends HomeState {
  final dynamic error;

  const HomeFailed(this.error);

  @override
  List<Object> get props => [error];
}
