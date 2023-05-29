import 'package:aula5/funcionario/presentation/crud/widgets/botao_gravar.dart';
import 'package:aula5/tarefa/data/model/tarefa.dart';
import 'package:flutter/material.dart';

import '../../data/datasources/insert.dart';
import '../../data/datasources/update.dart';

import 'widgets/data.dart';
import 'widgets/descricao.dart';
import 'widgets/status.dart';

class TarefaForm extends StatefulWidget {
  final TarefaModel? tarefaModel;

  const TarefaForm({
    Key? key,
    this.tarefaModel,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TarefaPageState createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _dataInicioController = TextEditingController();
  final TextEditingController _dataTerminoController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  @override
  void initState() {
    if (widget.tarefaModel != null) {
      _descricaoController.text = widget.tarefaModel!.descricao;
      _dataInicioController.text = widget.tarefaModel!.dataInicio;
      _dataTerminoController.text = widget.tarefaModel!.dataTermino;
      _statusController.text = widget.tarefaModel!.status;
    }
    super.initState();
  }

  Future<void> _salvarDateInicio(formattedDate) async {
    setState(() {
      _dataInicioController.text = formattedDate;
    });
  }

  Future<void> _salvarDateTermino(formattedDate) async {
    setState(() {
      _dataTerminoController.text = formattedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar Tarefa')),
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
                  DescricaoTarefaField(controller: _descricaoController),
                  StatusTarefaField(controller: _statusController),
                  DataTarefaField(
                      dateInput: _dataInicioController,
                      salvarDateInicio: _salvarDateInicio,
                      text: 'Data Inicial'),
                  DataTarefaField(
                      dateInput: _dataTerminoController,
                      salvarDateInicio: _salvarDateTermino,
                      text: 'Data Termino'),
                  FuncionarioBotaoGravar(onPressedNovo: () {
                    _descricaoController.clear();
                    _dataInicioController.clear();
                    _dataTerminoController.clear();
                    _statusController.clear();
                  }, onPressed: () async {
                    FocusScope.of(context).unfocus();

                    if (_formKey.currentState!.validate()) {
                      if (widget.tarefaModel == null ||
                          widget.tarefaModel!.tarefaID == null) {
                        await TarefaInsertDataSource().insert(
                          tarefa: TarefaModel(
                            descricao: _descricaoController.text,
                            dataInicio: _dataInicioController.text,
                            dataTermino: _dataTerminoController.text,
                            status: _statusController.text,
                          ),
                        );
                      } else {
                        await TarefaUpdateDataSource().update(
                          tarefaModel: TarefaModel(
                            tarefaID: widget.tarefaModel!.tarefaID,
                            descricao: _descricaoController.text,
                            dataInicio: _dataInicioController.text,
                            dataTermino: _dataTerminoController.text,
                            status: _statusController.text,
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
