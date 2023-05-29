import 'package:aula5/projeto/data/model/projeto.dart';
import '../../../core/database/sqflite_database.dart';

class ProjetoUpdateDataSource {
  Future<int> update({required ProjetoModel projetoModel}) async {
    final db = await SqfliteDatabase.openDb();
    return await db.update(
      projetoTableName,
      projetoModel.toJson(),
      where: 'projetoID = ?',
      whereArgs: [projetoModel.projetoID],
    );
  }
}
