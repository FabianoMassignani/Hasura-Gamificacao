import 'package:aula5/cliente/presentation/crud/widgets/nome.dart';
import 'package:aula5/empresa/data/model/empresa.dart';
import 'package:flutter/material.dart';

import '../../data/datasources/insert.dart';
import '../../data/datasources/update.dart';
import 'widgets/botao_gravar.dart';
import 'widgets/endereco.dart';
import 'widgets/telefone.dart';

class EmpresaForm extends StatefulWidget {
  final EmpresaModel? empresaModel;

  const EmpresaForm({
    Key? key,
    this.empresaModel,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EmpresaPageState createState() => _EmpresaPageState();
}

class _EmpresaPageState extends State<EmpresaForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  @override
  void initState() {
    if (widget.empresaModel != null) {
      _nomeController.text = widget.empresaModel!.nome;
      _enderecoController.text = widget.empresaModel!.endereco;
      _telefoneController.text = widget.empresaModel!.telefone;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Empresa')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  NomeClienteField(controller: _nomeController),
                  EnderecoEmpresaField(
                    controller: _enderecoController,
                  ),
                  TelefoneEmpresaField(controller: _telefoneController),
                  EmpresaBotaoGravar(onPressedNovo: () {
                    _nomeController.clear();
                    _enderecoController.clear();
                    _telefoneController.clear();
                  }, onPressed: () async {
                    FocusScope.of(context).unfocus();

                    if (_formKey.currentState!.validate()) {
                      if (widget.empresaModel == null ||
                          widget.empresaModel!.empresaID == null) {
                        await EmpresaInsertDataSource().insert(
                          empresa: EmpresaModel(
                            nome: _nomeController.text,
                            endereco: _enderecoController.text,
                            telefone: _telefoneController.text,
                          ),
                        );
                      } else {
                        await EmpresaUpdateDataSource().update(
                          empresaModel: EmpresaModel(
                            empresaID: widget.empresaModel!.empresaID,
                            nome: _nomeController.text,
                            endereco: _enderecoController.text,
                            telefone: _telefoneController.text,
                          ),
                        );
                      }
                    }
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
