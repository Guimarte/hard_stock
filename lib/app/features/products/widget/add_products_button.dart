import 'package:flutter/material.dart';

class AddProductsButton extends StatelessWidget {
  IconData icon;
  Function() function;
  AddProductsButton({required this.icon, required this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(child: Icon(icon), onTap: function),
    );
  }
}
