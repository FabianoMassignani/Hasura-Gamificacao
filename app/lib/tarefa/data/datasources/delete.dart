import '../../../core/database/sqflite_database.dart';

class TarefaDeleteDataSource {
  Future<int> delete({required int id}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.delete(
      tarefaTableName,
      where: 'tarefaID = ?',
      whereArgs: [id],
    );
  }
}
