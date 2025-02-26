import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hard_stock/app/database/products_table.dart';
import 'package:hard_stock/app/features/products/bloc/products_events.dart';
import 'package:hard_stock/app/features/products/bloc/products_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class ProductsBloc extends Bloc<ProductsEvents, ProductsState> {
  ProductsBloc() : super(ProductsInitialState()) {
    on<SaveProductsEvent>(saveProducts);
    on<LoadProductsEvent>(loadProducts);
  }
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productQuantity = TextEditingController();
  TextEditingController get productName => _productName;
  TextEditingController get productQuantity => _productQuantity;

  void saveProducts(SaveProductsEvent events, Emitter emitter)async{

    
       print(events.products.name);
  }

  void loadProducts(LoadProductsEvent events, Emitter emitter) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? nome = prefs.getString("nome");
    print(nome);

    emitter(ProductsLoadState(prefs.getString("nome")!));
  }


  
}
