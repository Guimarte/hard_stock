import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hard_stock/app/features/products/bloc/products_bloc.dart';
import 'package:hard_stock/app/features/products/bloc/products_events.dart';
import 'package:hard_stock/app/features/products/bloc/products_state.dart';
import 'package:hard_stock/app/features/products/mixin/products_page_mixin.dart';
import 'package:hard_stock/app/features/products/widget/add_products_button.dart';
import 'package:hard_stock/app/features/products/widget/card_add_products.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> with ProductsPageMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lista de produtos"),
          actions: [
            AddProductsButton(
              icon: Icons.add,
              function: () {
                showDialog(
                  context: context,
                  builder: (BuildContext cxt) {
                    return CardAddProducts(
                      productsBloc: context.read<ProductsBloc>(),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsInitialState) {
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProductsBloc>().add(LoadProductsEvent());
                    },
                    child: Text("Atualizar"),
                  ),
                ],
              );
            }
            if (state is ProductsLoadState) {
              return Text(state.productname);
            } else {
              return ElevatedButton(
                onPressed: () {
                  context.read<ProductsBloc>().add(LoadProductsEvent());
                },
                child: Text("Atualizar"),
              );
            }
          },
        ),
      ),
    );
  }
}
