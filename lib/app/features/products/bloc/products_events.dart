import 'package:hard_stock/app/database/products_table.dart';

abstract class ProductsEvents {}

class SaveProductsEvent extends ProductsEvents {
  SaveProductsEvent(this.products);
  Products products;
}

class LoadProductsEvent extends ProductsEvents {}
