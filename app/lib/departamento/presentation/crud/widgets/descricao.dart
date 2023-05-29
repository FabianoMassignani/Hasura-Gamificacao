import 'package:flutter/material.dart';

class DescricaoFuncionarioField extends StatelessWidget {
  final TextEditingController controller;

  const DescricaoFuncionarioField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: controller,
      decoration: const InputDecoration(labelText: 'Descricao'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira a descricao';
        }
        return null;
      },
    );
  }
}
