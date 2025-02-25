import 'package:flutter/material.dart';
import 'package:hard_stock/app/core/flutter_barcode_scanner/barcode_scanner.dart';
import 'package:hard_stock/app/database/products_table.dart';
import 'package:hard_stock/app/features/products/bloc/products_bloc.dart';
import 'package:hard_stock/app/features/products/bloc/products_events.dart';
import 'package:hard_stock/app/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardAddProducts extends StatelessWidget {
  ProductsBloc productsBloc;
  CardAddProducts({required this.productsBloc, super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.4,
        height: MediaQuery.sizeOf(context).height * 0.5,
        child: Column(
          children: [
            CustomTextField(
              textEditingController: productsBloc.productName,
              hint: "Nome do Produto",
              textInputType: TextInputType.text,
            ),
            CustomTextField(
              textEditingController: productsBloc.productQuantity,
              hint: "Quantidade",
              textInputType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                BarcodeScan().scanBarcodeNormal();
              },
              child: Icon(Icons.camera),
            ),
            ElevatedButton(
              onPressed: () async {
                Products products = Products();
                products.barCode = 123;
                products.id = 1;
                products.name = "TESTE";
                products.quantity = 10.0;
               productsBloc.add(SaveProductsEvent(products));
              },
              child: Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
