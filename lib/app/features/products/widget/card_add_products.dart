import 'package:flutter/material.dart';
import 'package:hard_stock/app/core/flutter_barcode_scanner/barcode_scanner.dart';

class CardAddProducts extends StatelessWidget {
  const CardAddProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.4,
        height: MediaQuery.sizeOf(context).height * 0.5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(helperText: "Nome"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                BarcodeScan().scanBarcodeNormal();
              },
              child: Icon(Icons.camera),
            ),
          ],
        ),
      ),
    );
  }
}
