part of 'product_detail_cubit.dart';

@immutable
abstract class ProductDetailState {
  const ProductDetailState();
}

class ProductDetailInitial extends ProductDetailState {
  const ProductDetailInitial();
}

class ProductDetailLoading extends ProductDetailState {
  const ProductDetailLoading();
}

class ProductDetailLoaded extends ProductDetailState {
  final Product product;
  const ProductDetailLoaded({required this.product});
}

class ProductDetailError extends ProductDetailState {
  final String error;
  const ProductDetailError({this.error = ''});
}