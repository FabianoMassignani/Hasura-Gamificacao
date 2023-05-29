import 'package:aula5/cliente/data/model/cliente.dart';
import 'package:aula5/funcionario/data/datasources/delete.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/app_listtile.dart';
import '../../widgets/drawer_pages.dart';
import '../data/datasources/list.dart';
import 'crud/crud.dart';

class ClienteList extends StatefulWidget {
  const ClienteList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends State<ClienteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text('Clientes'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: FutureBuilder<List<ClienteModel>>(
          future: ClienteListDataSource().getAll(),
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.done:
                final List<ClienteModel> clientes = snapshot.data;
                if (clientes.isEmpty) {
                  return const Center(
                    child: Text('Ainda não foi registrado nenhum Cliente.'),
                  );
                }
                return ListView.builder(
                  itemCount: clientes.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ClienteModel cliente = clientes[index];

                    return Dismissible(
                      onDismissed: (direction) {
                        FuncionarioDeleteDataSource()
                            .delete(id: cliente.clienteID!);
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
                                    'Remover ${cliente.nome.toUpperCase()}?'),
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
                        title: cliente.nomeCompleto,
                        line01Text: cliente.endereco,
                        line02Text: cliente.telefone,
                        imageURL:
                            'https://static.thenounproject.com/png/340719-200.png',
                        onEditPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClienteForm(
                                clienteModel: cliente,
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
            MaterialPageRoute(builder: (context) => const ClienteForm()),
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
