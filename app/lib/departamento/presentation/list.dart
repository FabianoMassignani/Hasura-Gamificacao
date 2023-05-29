import 'package:aula5/departamento/data/datasources/delete.dart';
import 'package:aula5/departamento/data/model/departamento.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/app_listtile.dart';
import '../../widgets/drawer_pages.dart';
import '../data/datasources/remote_api/list.dart';
import 'crud/crud.dart';

class DepartamentoList extends StatefulWidget {
  const DepartamentoList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DepartamentoPageState createState() => _DepartamentoPageState();
}

class _DepartamentoPageState extends State<DepartamentoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Funcionarios'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: FutureBuilder<List<DepartamentoModel>>(
          future: DepartamentoListDataSource().getDepartamentos(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.done:
                final List<DepartamentoModel> departamentos = snapshot.data;
                if (departamentos.isEmpty) {
                  return const Center(
                    child:
                        Text('Ainda não foi registrado nenhum departamento.'),
                  );
                }
                return ListView.builder(
                  itemCount: departamentos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final DepartamentoModel departamento = departamentos[index];

                    return Dismissible(
                      onDismissed: (direction) {
                        DepartamentoDeleteDataSource()
                            .delete(id: departamento.departamentoID!);
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
                                    'Remover ${departamento.nome.toUpperCase()}?'),
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
                        title: departamento.nome,
                        line01Text: departamento.descricao,
                        imageURL:
                            'https://static.thenounproject.com/png/340719-200.png',
                        onEditPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DepartamentoForm(
                                departamentoModel: departamento,
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
            MaterialPageRoute(builder: (context) => const DepartamentoForm()),
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
