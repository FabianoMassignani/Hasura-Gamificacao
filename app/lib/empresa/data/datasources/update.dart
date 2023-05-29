import 'package:aula5/empresa/data/model/empresa.dart';
import '../../../core/database/sqflite_database.dart';

class EmpresaUpdateDataSource {
  Future<int> update({required EmpresaModel empresaModel}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.update(
      empresaTableName,
      empresaModel.toJson(),
      where: 'empresaID = ?',
      whereArgs: [empresaModel.empresaID],
    );
  }
}
