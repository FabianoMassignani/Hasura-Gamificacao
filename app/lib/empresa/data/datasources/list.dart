import 'package:aula5/core/database/sqflite_database.dart';
import '../model/empresa.dart';

class EmpresaListDataSource {
  Future<List<EmpresaModel>> getAll() async {
    final db = await SqfliteDatabase.openDb();
    final List<Map<String, dynamic>> maps = await db.query(empresaTableName);
    return List.generate(maps.length, (i) {
      return EmpresaModel.fromJson(maps[i]);
    });
  }
}
