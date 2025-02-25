import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController textEditingController;
  TextInputType textInputType;
  String hint;

  CustomTextField({
    required this.textEditingController,
    required this.hint,
    required this.textInputType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          hintText: hint,
        ),
      ),
    );
  }
}
