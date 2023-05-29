import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/departamento.dart';

class DepartamentoInsertDataSource {
  final String baseUrl = 'http://10.0.2.2/Departamento';

  Future<DepartamentoModel> createDepartamento(
      {required DepartamentoModel departamento}) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(departamento.toJson()),
    );

    if (response.statusCode == 201) {
      return DepartamentoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar departamento.');
    }
  }
}
