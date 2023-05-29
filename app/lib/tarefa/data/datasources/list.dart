import 'package:aula5/core/database/sqflite_database.dart';
import 'package:aula5/tarefa/data/model/tarefa.dart';

class TarefaListDataSource {
  Future<List<TarefaModel>> getAll() async {
    final db = await SqfliteDatabase.openDb();
    final List<Map<String, dynamic>> maps = await db.query(tarefaTableName);

    return List.generate(maps.length, (i) {
      return TarefaModel.fromJson(maps[i]);
    });
  }
}
