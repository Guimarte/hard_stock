import 'package:flutter/material.dart';
import 'package:hard_stock/app/features/products/widget/add_products_button.dart';
import 'package:hard_stock/app/features/products/widget/card_add_products.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

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
                  builder: (BuildContext context) {
                    return CardAddProducts();
                  },
                );
              },
            ),
          ],
        ),
        body: Column(),
      ),
    );
  }
}
