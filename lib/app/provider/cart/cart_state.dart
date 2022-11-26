part of 'cart_cubit.dart';

@immutable
abstract class CartState {
  const CartState();
}

class CartInitial extends CartState {
  const CartInitial();
}

class CartLoading extends CartState {
  const CartLoading();
}

class CartLoaded extends CartState {
  final Cart cart;
  const CartLoaded({ required this.cart});
}

class CartError extends CartState {
  final String error;
  const CartError({this.error = ''});
}