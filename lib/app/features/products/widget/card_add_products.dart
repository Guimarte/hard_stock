import 'package:flutter/material.dart';
import 'package:hard_stock/app/core/flutter_barcode_scanner/barcode_scanner.dart';
import 'package:hard_stock/app/features/products/bloc/products_bloc.dart';
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
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                print("TESTE TESTE TESTE TESTE ");
                print(productsBloc.productName.text);
                prefs.setString("nome", productsBloc.productName.text);
                Navigator.pop(context);
              },
              child: Text("Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
