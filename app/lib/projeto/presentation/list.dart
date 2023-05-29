import 'package:aula5/projeto/data/datasources/delete.dart';
import 'package:aula5/projeto/data/model/projeto.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/app_listtile.dart';
import '../../widgets/drawer_pages.dart';
import '../data/datasources/list.dart';
import 'crud/crud.dart';

class ProjetoList extends StatefulWidget {
  const ProjetoList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProjetoPageState createState() => _ProjetoPageState();
}

class _ProjetoPageState extends State<ProjetoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projetos'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: FutureBuilder<List<ProjetoModel>>(
          future: ProjetoListDataSource().getAll(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.done:
                final List<ProjetoModel> projetos = snapshot.data;
                if (projetos.isEmpty) {
                  return const Center(
                    child: Text('Ainda não foi registrado nenhum funcionário.'),
                  );
                }
                return ListView.builder(
                  itemCount: projetos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ProjetoModel projeto = projetos[index];

                    return Dismissible(
                      onDismissed: (direction) {
                        ProjetoDeleteDataSource()
                            .delete(id: projeto.projetoID!);
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
                                    'Remover ${projeto.nome.toUpperCase()}?'),
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
                        title: projeto.nome,
                        line01Text: 'Inicio: ${projeto.dataInicio}',
                        line02Text: 'Fim: ${projeto.dataTermino}',
                        imageURL:
                            'https://static.thenounproject.com/png/340719-200.png',
                        onEditPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProjetoForm(
                                projetoModel: projeto,
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
            MaterialPageRoute(builder: (context) => const ProjetoForm()),
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
