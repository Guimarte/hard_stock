import 'package:flutter/material.dart';
import 'package:hard_stock/app/database/products_table.dart';
import 'package:hard_stock/app/features/products/presentation/products_page.dart';

mixin ProductsPageMixin on State<ProductsPage> {
  @override
  initState() {
    super.initState();
    ProductsTableProvider().open("teste.db");
  }
}
