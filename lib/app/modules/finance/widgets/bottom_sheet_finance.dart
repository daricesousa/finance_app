import 'package:finance_app/app/core/widgets/app_bottom_sheet.dart';
import 'package:flutter/material.dart';

class BottomSheetFinance extends StatelessWidget {
  final void Function(int) callback;
  const BottomSheetFinance({Key? key, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      itens: [
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text("Editar"),
          onTap: () => callback.call(1),
        ),
        ListTile(
          leading: const Icon(Icons.my_library_books_rounded),
          title: const Text("Detalhes"),
          onTap: () => callback.call(2),
        ),
        ListTile(
            leading: const Icon(Icons.delete),
            title: const Text("Deletar"),
            onTap: () => callback.call(3)),
      ],
    );
  }
}
