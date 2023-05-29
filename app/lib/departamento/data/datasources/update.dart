import 'package:aula5/departamento/data/model/departamento.dart';

import '../../../core/database/sqflite_database.dart';

class DepartamentoUpdateDataSource {
  Future<int> update({required DepartamentoModel departamentoModel}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.update(
      departamentoTableName,
      departamentoModel.toJson(),
      where: 'departamentoID = ?',
      whereArgs: [departamentoModel.departamentoID],
    );
  }
}
