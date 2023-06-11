import 'dart:convert';

import 'package:hasura_connect/hasura_connect.dart' hide Request, Response;
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

Future<Response> deleteDepartamento(
  Request request,
  Injector injector,
  ModularArguments arguments,
) async {
  final hasuraConnect = injector.get<HasuraConnect>();

  final departamentoID =
      int.parse(request.url.queryParameters['departamentoID'] ?? '');

  var hasuraResponse = await hasuraConnect.mutation('''
      mutation DeleteDepartamento(\$departamentoID: Int!) {
        delete_departamentos(where: { departamentoID: {_eq: \$departamentoID} }) {
          affected_rows
        }
      }
      ''', variables: {'departamentoID': departamentoID});

  return Response.ok(jsonEncode(hasuraResponse['data']));
}
