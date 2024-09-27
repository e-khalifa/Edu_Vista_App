part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Course> cartItems;

  CartLoaded(this.cartItems);
}

class CartUpdated extends CartState {
  final List<Course> cartItems;

  CartUpdated(this.cartItems);
}

class CartPurchaseSuccess extends CartState {}

class CartBoughtCourses extends CartState {
  final List<Course> boughtCourses;

  CartBoughtCourses(this.boughtCourses);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}
