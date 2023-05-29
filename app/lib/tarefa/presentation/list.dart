import 'package:aula5/funcionario/data/datasources/delete.dart';

import 'package:aula5/tarefa/data/model/tarefa.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/app_listtile.dart';
import '../../widgets/drawer_pages.dart';
import '../data/datasources/list.dart';
import 'crud/crud.dart';

class TarefaList extends StatefulWidget {
  const TarefaList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TarefaPageState createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text('Tarefas'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: FutureBuilder<List<TarefaModel>>(
          future: TarefaListDataSource().getAll(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.done:
                final List<TarefaModel> tarefas = snapshot.data;
                if (tarefas.isEmpty) {
                  return const Center(
                    child: Text('Ainda não foi registrado nenhuma tarefa.'),
                  );
                }
                return ListView.builder(
                  itemCount: tarefas.length,
                  itemBuilder: (BuildContext context, int index) {
                    final TarefaModel tarefa = tarefas[index];

                    return Dismissible(
                      onDismissed: (direction) {
                        FuncionarioDeleteDataSource()
                            .delete(id: tarefa.tarefaID!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            showCloseIcon: true,
                            closeIconColor: Colors.white,
                            backgroundColor: Colors.indigo,
                            content: Text(
                              'Remoção bem sucedida',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                      confirmDismiss: (direction) async {
                        return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Confirma remover?'),
                                content: Text(
                                    'Remover ${tarefa.descricao.toUpperCase()}?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                    child: const Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            });
                      },
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Remover',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 32,
                            ),
                          ],
                        ),
                      ),
                      key: Key('$index'),
                      child: AppListTile(
                        isOdd: index.isOdd,
                        title: tarefa.descricao,
                        line01Text: 'Inicio: ${tarefa.dataInicio}',
                        line02Text: 'Fim: ${tarefa.dataTermino}',
                        imageURL:
                            'https://static.thenounproject.com/png/340719-200.png',
                        onEditPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TarefaForm(
                                tarefaModel: tarefa,
                              ),
                            ),
                          );
                          setState(() {});
                        },
                      ),
                    );
                  },
                );
              default:
                return Container(
                  color: Colors.red,
                );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TarefaForm()),
          );
          setState(() {});
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: DrawerPage.getWidget(context),
    );
  }
}
