import 'package:aula5/cliente/data/model/cliente.dart';
import '../../../core/database/sqflite_database.dart';

class ClienteUpdateDataSource {
  Future<int> update({required ClienteModel clienteModel}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.update(
      clienteTableName,
      clienteModel.toJson(),
      where: 'clienteID = ?',
      whereArgs: [clienteModel.clienteID],
    );
  }
}
