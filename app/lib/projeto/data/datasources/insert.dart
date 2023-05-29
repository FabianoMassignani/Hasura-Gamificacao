import '../../../core/database/sqflite_database.dart';
import '../model/projeto.dart';

class ProjetoInsertDataSource {
  Future<int> insert({required ProjetoModel projeto}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.insert(
      projetoTableName,
      projeto.toJson(),
    );
  }
}
