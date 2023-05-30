import 'dart:convert';

import 'package:hasura_connect/hasura_connect.dart' hide Request, Response;
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

Future<Response> insertDepartamento(
  Request request,
  Injector injector,
  ModularArguments arguments,
) async {
  final hasuraConnect = injector.get<HasuraConnect>();

  // Extract the parameters from the request URL
  final Map<String, dynamic> params = request.url.queryParameters;

  // Prepare the variables for the insert mutation
  final variables = {
    "nome": params[
        'nome'], // Replace 'nome' with the actual parameter name for the department name
  };

  // Construct the mutation query
  final mutation = '''
    mutation InsertDepartamento(\$nome: String!) {
      insert_departamentos(objects: {nome: \$nome}) {
        affected_rows
      }
    }
  ''';

  // Execute the mutation
  var hasuraResponse =
      await hasuraConnect.mutation(mutation, variables: variables);

  return Response.ok(jsonEncode(hasuraResponse['data']));
}
