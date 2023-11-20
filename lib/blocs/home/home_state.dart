part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<Category> categories;
  final List<Product> popularProducts;
  final List<Product> featuredProducts;
  final Product? productOfTheDay;

  HomeState(
      {this.status = HomeStatus.initial,
      this.categories = const [],
      this.popularProducts = const [],
      this.featuredProducts = const [],
      this.productOfTheDay});
  HomeState copyWith({
    HomeStatus? status,
    List<Category>? categories,
    List<Product>? popularProducts,
    List<Product>? featuredProducts,
    Product? productOfTheDay,
  }) {
    return HomeState(
        status: status ?? this.status,
        categories: categories ?? this.categories,
        popularProducts: popularProducts ?? this.popularProducts,
        featuredProducts: featuredProducts ?? this.featuredProducts,
        productOfTheDay: productOfTheDay ?? this.productOfTheDay);
  }

  @override
  List<Object?> get props =>
      [status, categories, popularProducts, featuredProducts, productOfTheDay];
}
