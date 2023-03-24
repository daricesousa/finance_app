import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final int? maxLength;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;

  const AppFormField({
    Key? key,
    this.controller,
    this.label = "",
    this.maxLength, 
    this.textInputType,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(5), child:
    TextFormField(
        maxLength: maxLength,
        autofocus: true,
        controller: controller,
        keyboardType: textInputType,
        textInputAction: TextInputAction.next,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        )));
  }
}
