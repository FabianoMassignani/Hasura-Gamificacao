import '../../../core/database/sqflite_database.dart';
import '../model/cliente.dart';

class ClienteInsertDataSource {
  Future<int> insert({required ClienteModel cliente}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.insert(
      clienteTableName,
      cliente.toJson(),
    );
  }
}
