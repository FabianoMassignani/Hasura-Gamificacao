import 'package:flutter/material.dart';

class StatusTarefaField extends StatelessWidget {
  final TextEditingController controller;

  const StatusTarefaField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(labelText: 'Status'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira um status';
        }
        return null;
      },
    );
  }
}
