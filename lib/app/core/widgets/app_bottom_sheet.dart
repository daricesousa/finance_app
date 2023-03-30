import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  final List<Widget> itens;
  const AppBottomSheet({Key? key, required this.itens}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: itens);
  }
}
