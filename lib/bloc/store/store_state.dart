part of 'store_cubit.dart';

class StoreState {
  const StoreState({
    this.errorMessage,
    this.products,
    this.loading,
    this.paginationfrom,
    this.total,
  });

  final String? errorMessage;
  final product? products;
  final bool? loading;
  final int? paginationfrom;
  final int? total;

  StoreState copyWith(
      {String? errorMessage, product? products, int? total, bool? loading, int? paginationfrom}) {
    return StoreState(
      errorMessage: errorMessage ?? this.errorMessage,
      products: products ?? this.products,
      loading: loading ?? this.loading,
      total: total ?? this.total,
      paginationfrom: paginationfrom ?? this.paginationfrom,
    );
  }
}
