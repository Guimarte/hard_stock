abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

class ProductsLoadState extends ProductsState {
  ProductsLoadState(this.productname);
  String productname;
}
