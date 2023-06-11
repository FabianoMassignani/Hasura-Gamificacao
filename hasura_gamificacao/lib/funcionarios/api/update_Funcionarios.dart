import 'dart:convert';

import 'package:hasura_connect/hasura_connect.dart' hide Request, Response;
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

Future<Response> updateFuncionario(
  Request request,
  Injector injector,
  ModularArguments arguments,
) async {
  final hasuraConnect = injector.get<HasuraConnect>();

  final funcionarioID =
      int.parse(request.url.queryParameters['funcionarioID'] ?? '');
  final nome = request.url.queryParameters['nome'] ?? '';
  final sobrenome = request.url.queryParameters['sobrenome'] ?? '';
  final endereco = request.url.queryParameters['endereco'] ?? '';
  final telefone = request.url.queryParameters['telefone'] ?? '';

  var hasuraResponse = await hasuraConnect.mutation('''
      mutation UpdateFuncionario(\$funcionarioID: Int!, \$nome: String!, \$sobrenome: String!, \$endereco: String!, \$telefone: String!) {
        update_funcionarios(where: { funcionarioID: {_eq: \$funcionarioID} }, _set: { nome: \$nome, sobrenome: \$sobrenome, endereco: \$endereco, telefone: \$telefone }) {
          affected_rows
        }
      }
      ''', variables: {
    'funcionarioID': funcionarioID,
    'nome': nome,
    'sobrenome': sobrenome,
    'endereco': endereco,
    'telefone': telefone
  });

  return Response.ok(jsonEncode(hasuraResponse['data']));
}
