import '../../../core/database/sqflite_database.dart';

class ClienteDeleteDataSource {
  Future<int> delete({required int id}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.delete(
      clienteTableName,
      where: 'clienteID = ?',
      whereArgs: [id],
    );
  }
}
