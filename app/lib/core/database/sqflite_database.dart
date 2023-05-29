import 'package:sqflite/sqflite.dart';

const String clienteTableName = 'clientes';
const String funcionarioTableName = 'funcionarios';
const String departamentoTableName = 'departamentos';
const String empresaTableName = 'empresa';
const String tarefaTableName = 'tarefa';
const String projetoTableName = 'projeto';

class SqfliteDatabase {
  static Future<Database> openDb() async {
    // final dbPath = await getDatabasesPath();
    // final dbFile = join(dbPath, 'gamificacao02.db');

    // await deleteDatabase(dbFile);

    final db = await openDatabase(
      'gamificacao05.db',
      version: 1,
      onCreate: (db, version) {
        return createTables(db);
      },
    );
    return db;
  }

  static Future<void> createTables(Database db) async {
    await db.execute('''
      CREATE TABLE $funcionarioTableName (
        funcionarioID INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        sobrenome TEXT,
        endereco TEXT,
        telefone TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $departamentoTableName (
        departamentoID INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        descricao TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $clienteTableName (
        clienteID INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        sobrenome TEXT,
        endereco TEXT,
        telefone TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $empresaTableName (
        empresaID INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        endereco TEXT,
        telefone TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $tarefaTableName (
        tarefaID INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao TEXT,
        dataInicio TEXT,
        dataTermino TEXT,
        status TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $projetoTableName (
        projetoID INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        descricao TEXT,
        dataInicio TEXT,
        dataTermino TEXT
      )
    ''');
  }
}
