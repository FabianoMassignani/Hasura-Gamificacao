import '../../../core/database/sqflite_database.dart';
import '../model/empresa.dart';

class EmpresaInsertDataSource {
  Future<int> insert({required EmpresaModel empresa}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.insert(
      empresaTableName,
      empresa.toJson(),
    );
  }
}
