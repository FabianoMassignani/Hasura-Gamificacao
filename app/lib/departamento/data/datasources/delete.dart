import '../../../core/database/sqflite_database.dart';

class DepartamentoDeleteDataSource {
  Future<int> delete({required int id}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.delete(
      departamentoTableName,
      where: 'departamentoID = ?',
      whereArgs: [id],
    );
  }
}
