import 'package:aula5/tarefa/data/model/tarefa.dart';
import '../../../core/database/sqflite_database.dart';

class TarefaUpdateDataSource {
  Future<int> update({required TarefaModel tarefaModel}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.update(
      funcionarioTableName,
      tarefaModel.toJson(),
      where: 'tarefaID = ?',
      whereArgs: [tarefaModel.tarefaID],
    );
  }
}
