import 'dart:convert';

import 'package:hasura_connect/hasura_connect.dart' hide Request, Response;
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

Future<Response> updateDepartamento(
  Request request,
  Injector injector,
  ModularArguments arguments,
) async {
  final hasuraConnect = injector.get<HasuraConnect>();

  final departamentoID =
      int.parse(request.url.queryParameters['departamentoID'] ?? '');
  final nome = request.url.queryParameters['nome'] ?? '';
  final descricao = request.url.queryParameters['descricao'] ?? '';

  var hasuraResponse = await hasuraConnect.mutation('''
      mutation UpdateDepartamento(\$departamentoID: Int!, \$nome: String!, \$descricao: String!) {
        update_departamentos(where: { departamentoID: {_eq: \$departamentoID} }, _set: { nome: \$nome, descricao: \$descricao}) {
          affected_rows
        }
      }
      ''', variables: {
    'departamentoID': departamentoID,
    'nome': nome,
    'descricao': descricao,
  });

  return Response.ok(jsonEncode(hasuraResponse['data']));
}
