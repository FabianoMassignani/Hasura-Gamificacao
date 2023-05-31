import 'dart:convert';

import 'package:hasura_connect/hasura_connect.dart' hide Request, Response;
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

Future<Response> deleteFuncionario(
  Request request,
  Injector injector,
  ModularArguments arguments,
) async {
  final hasuraConnect = injector.get<HasuraConnect>();

  final funcionarioID =
      int.parse(request.url.queryParameters['funcionarioID'] ?? '');

  var hasuraResponse = await hasuraConnect.mutation('''
      mutation DeleteFuncionario(\$funcionarioID: Int!) {
        delete_funcionarios(where: { funcionarioID: {_eq: \$funcionarioID} }) {
          affected_rows
        }
      }
      ''', variables: {'funcionarioID': funcionarioID});

  return Response.ok(jsonEncode(hasuraResponse['data']));
}
