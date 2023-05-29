import 'package:aula5/core/database/sqflite_database.dart';
import '../model/cliente.dart';

class ClienteListDataSource {
  Future<List<ClienteModel>> getAll() async {
    final db = await SqfliteDatabase.openDb();
    final List<Map<String, dynamic>> maps = await db.query(clienteTableName);
    return List.generate(maps.length, (i) {
      return ClienteModel.fromJson(maps[i]);
    });
  }
}
