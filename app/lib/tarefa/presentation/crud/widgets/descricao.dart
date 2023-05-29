import 'package:flutter/material.dart';

class DescricaoTarefaField extends StatelessWidget {
  final TextEditingController controller;

  const DescricaoTarefaField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(labelText: 'Descricao'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira uma descicao';
        }
        return null;
      },
    );
  }
}
