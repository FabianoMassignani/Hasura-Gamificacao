import '../../../core/database/sqflite_database.dart';
import '../model/departamento.dart';

class DepartamentoInsertDataSource2 {
  Future<int> insert({required DepartamentoModel departamento}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.insert(
      departamentoTableName,
      departamento.toJson(),
    );
  }
}
