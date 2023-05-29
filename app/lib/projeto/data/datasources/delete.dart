import '../../../core/database/sqflite_database.dart';

class ProjetoDeleteDataSource {
  Future<int> delete({required int id}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.delete(
      projetoTableName,
      where: 'projetoID = ?',
      whereArgs: [id],
    );
  }
}
