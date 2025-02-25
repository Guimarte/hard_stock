abstract class ProductsEvents {}

class SaveProductsEvent extends ProductsEvents {
  SaveProductsEvent(this.name);
  String name;
}

class LoadProductsEvent extends ProductsEvents {}
