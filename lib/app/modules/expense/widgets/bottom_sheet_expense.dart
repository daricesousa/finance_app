import 'package:finance_app/app/core/ui/app_color.dart';
import 'package:finance_app/app/core/widgets/app_bottom_sheet.dart';
import 'package:flutter/material.dart';

class BottomSheetExpense extends StatelessWidget {
  final Function(int?) callback;
  const BottomSheetExpense({Key? key, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      itens: [
        ListTile(
          leading: const Icon(Icons.edit, color: AppColor.dark),
          title: const Text(
            "Editar",
            style: TextStyle(color: AppColor.dark),
          ),
          onTap: () => callback.call(1),
        ),
        ListTile(
          leading:
              const Icon(Icons.my_library_books_rounded, color: AppColor.dark),
          title: const Text(
            "Detalhes",
            style: TextStyle(
              color: AppColor.dark,
            ),
          ),
          onTap: () => callback.call(2),
        ),
        ListTile(
          leading: const Icon(Icons.delete, color: AppColor.dark),
          title: const Text(
            "Deletar",
            style: TextStyle(color: AppColor.dark),
          ),
          onTap: () => callback.call(3),
        )
      ],
    );
  }
}
