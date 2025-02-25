import 'package:hard_stock/app/features/products/bloc/products_events.dart';
import 'package:hard_stock/app/features/products/bloc/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductsBloc extends Bloc<ProductsEvents,ProductsState>{
  ProductsBloc():super(ProductsInitialState());
}