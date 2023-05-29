import 'package:aula5/core/database/sqflite_database.dart';

import '../model/projeto.dart';

class ProjetoListDataSource {
  Future<List<ProjetoModel>> getAll() async {
    final db = await SqfliteDatabase.openDb();
    final List<Map<String, dynamic>> maps = await db.query(projetoTableName);

    return List.generate(maps.length, (i) {
      return ProjetoModel.fromJson(maps[i]);
    });
  }
}
