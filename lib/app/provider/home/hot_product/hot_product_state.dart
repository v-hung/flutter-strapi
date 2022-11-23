part of 'hot_product_cubit.dart';

@immutable
abstract class HotProductState {
  const HotProductState();
}

class HotProductInitial extends HotProductState {
  const HotProductInitial();
}

class HotProductLoading extends HotProductState {
  const HotProductLoading();
}

class HotProductLoaded extends HotProductState {
  final Collection hot_product;
  const HotProductLoaded({ required this.hot_product});
}

class HotProductError extends HotProductState {
  final String error;
  const HotProductError({this.error = ''});
}