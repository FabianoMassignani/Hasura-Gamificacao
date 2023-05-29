import 'package:aula5/tarefa/data/model/tarefa.dart';
import '../../../core/database/sqflite_database.dart';

class TarefaInsertDataSource {
  Future<int> insert({required TarefaModel tarefa}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.insert(
      tarefaTableName,
      tarefa.toJson(),
    );
  }
}
