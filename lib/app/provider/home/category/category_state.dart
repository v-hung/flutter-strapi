part of 'category_cubit.dart';

@immutable
abstract class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

class CategoryLoading extends CategoryState {
  const CategoryLoading();
}

class CategoryLoaded extends CategoryState {
  final CategoryList categories;
  const CategoryLoaded({ required this.categories});
}

class CategoryError extends CategoryState {
  final String error;
  const CategoryError({this.error = ''});
}