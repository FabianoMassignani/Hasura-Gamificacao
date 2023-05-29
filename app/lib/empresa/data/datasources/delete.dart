import '../../../core/database/sqflite_database.dart';

class EmpresaDeleteDataSource {
  Future<int> delete({required int id}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.delete(
      empresaTableName,
      where: 'empresaID = ?',
      whereArgs: [id],
    );
  }
}
