import 'dart:convert';

import 'package:hasura_connect/hasura_connect.dart' hide Request, Response;
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

Future<Response> insertFuncionario(
  Request request,
  Injector injector,
  ModularArguments arguments,
) async {
  final hasuraConnect = injector.get<HasuraConnect>();

  final nome = request.url.queryParameters['nome'] ?? '';
  final sobrenome = request.url.queryParameters['sobrenome'] ?? '';
  final endereco = request.url.queryParameters['endereco'] ?? '';
  final telefone = request.url.queryParameters['telefone'] ?? '';

  var hasuraResponse = await hasuraConnect.mutation('''
      mutation CreateFuncionario(\$nome: String!, \$sobrenome: String!, \$endereco: String!, \$telefone: String!) {
        insert_funcionarios(objects: { nome: \$nome, sobrenome: \$sobrenome, endereco: \$endereco, telefone: \$telefone }) {
          affected_rows
        }
      }
      ''', variables: {
    'nome': nome,
    'sobrenome': sobrenome,
    'endereco': endereco,
    'telefone': telefone
  });

  return Response.ok(jsonEncode(hasuraResponse['data']));
}
