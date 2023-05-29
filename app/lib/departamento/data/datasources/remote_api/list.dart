import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../model/departamento.dart';

class DepartamentoListDataSource {
  final String baseUrl = 'http://10.0.2.2/Departamento';

  Future<List<DepartamentoModel>> getDepartamentos() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse
          .map((json) => DepartamentoModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Falha ao carregar departamentos.');
    }
  }

  Future<DepartamentoModel> getDepartamentoById(int id) async {
    final url = '$baseUrl/$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return DepartamentoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao carregar departamento.');
    }
  }
}
