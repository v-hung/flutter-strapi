part of 'featured_products_cubit.dart';

@immutable
abstract class FeaturedProductsState {
  const FeaturedProductsState();
}

class FeaturedProductsInitial extends FeaturedProductsState {
  const FeaturedProductsInitial();
}

class FeaturedProductsLoading extends FeaturedProductsState {
  const FeaturedProductsLoading();
}

class FeaturedProductsLoaded extends FeaturedProductsState {
  final ProductList featured_products;
  const FeaturedProductsLoaded({ required this.featured_products});
}

class FeaturedProductsError extends FeaturedProductsState {
  final String error;
  const FeaturedProductsError({this.error = ''});
}