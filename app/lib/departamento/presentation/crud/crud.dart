import 'package:aula5/departamento/data/model/departamento.dart';
import 'package:aula5/funcionario/presentation/crud/widgets/botao_gravar.dart';
import 'package:flutter/material.dart';

import '../../data/datasources/remote_api/insert.dart';
import '../../data/datasources/update.dart';
import 'widgets/descricao.dart';
import 'widgets/nome.dart';

class DepartamentoForm extends StatefulWidget {
  final DepartamentoModel? departamentoModel;

  const DepartamentoForm({
    Key? key,
    this.departamentoModel,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DepartamentoPageState createState() => _DepartamentoPageState();
}

class _DepartamentoPageState extends State<DepartamentoForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  @override
  void initState() {
    if (widget.departamentoModel != null) {
      _nomeController.text = widget.departamentoModel!.nome;
      _descricaoController.text = widget.departamentoModel!.descricao;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Funcionario')),
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
                  NomeFuncionarioField(controller: _nomeController),
                  DescricaoFuncionarioField(controller: _descricaoController),
                  FuncionarioBotaoGravar(onPressedNovo: () {
                    _nomeController.clear();
                    _descricaoController.clear();
                  }, onPressed: () async {
                    FocusScope.of(context).unfocus();

                    if (_formKey.currentState!.validate()) {
                      if (widget.departamentoModel == null ||
                          widget.departamentoModel!.departamentoID == null) {
                        await DepartamentoInsertDataSource().createDepartamento(
                          departamento: DepartamentoModel(
                            nome: _nomeController.text,
                            descricao: _descricaoController.text,
                          ),
                        );
                      } else {
                        await DepartamentoUpdateDataSource().update(
                          departamentoModel: DepartamentoModel(
                            departamentoID:
                                widget.departamentoModel!.departamentoID,
                            nome: _nomeController.text,
                            descricao: _descricaoController.text,
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
