import 'package:mobx/mobx.dart';
import 'package:sqfcrud/app/models/clientes_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @action
  Future<Database> createDatabase() async {
    String databasePath = await getDatabasesPath();
    String dbPath = join(databasePath, 'crud_cliente.db');

    return openMyDatabase(dbPath, 1, populateDb);
  }

  @action
  Future<Database> openMyDatabase(
      String dbPath, int version, void initializeMethod(Database database, int version)) async {
    var database = await openDatabase(dbPath, version: 1, onCreate: initializeMethod);
    return database;
  }

  @observable
  late Database database;

  @observable
  bool isCreated = false;

  @action
  Future populateDb(Database database, int version) async {
    await database
        .execute("CREATE TABLE clientes("
            "id_cliente INTEGER PRIMARY KEY,"
            "nome_cliente TEXT,"
            "email_cliente TEXT,"
            "celular_cliente TEXT,"
            "senha_cliente TEXT,"
            "status_cliente INTEGER," // 0 - Inativo | 1 - Ativo
            "dta_cadastro TEXT"
            ")")
        .then((value) => isCreated);
  }

  @action
  Future<int> createCliente(Cliente cliente, Database database) async {
    var result = await database.insert("clientes", cliente.toJson());
    return result;
  }

  @action
  Future<int> createClientePureSql(Cliente cliente, Database database) async {
    String dataAtual = DateFormat("dd/MM/yyyy", "pt_BR").format(DateTime.now());
    var result = await database.rawInsert(
        "INSERT INTO clientes (nome_cliente, email_cliente, celular_cliente, senha_cliente, status_cliente, dta_cadastro) "
        "VALUES (${cliente.nome_cliente}, ${cliente.email_cliente},"
        " ${cliente.celular_cliente}, ${md5.convert(utf8.encode(cliente.senha_cliente!)).toString()}"
        " , 1, $dataAtual)");

    return result;
  }

  @action
  Future<List> getAllClientes(Database database) async {
    var result = await database.query("clientes",
        columns: ["id_cliente", "nome_cliente", "email_cliente", "celular_cliente", "status_cliente", "dta_cadastro"]);

    return result.toList();
  }

  @action
  Future<List> getAllClientesPure(Database database) async {
    var result = await database.rawQuery("SELECT * from clientes");

    return result.toList();
  }

  @action
  Future<Cliente?> getClienteById(int id, Database database) async {
    List<Map<String, dynamic>> result = await database.query("clientes",
        columns: ["id_cliente", "nome_cliente", "email_cliente", "celular_cliente", "status_cliente", "dta_cadastro"],
        where: 'id_cliente = ?',
        whereArgs: [id]);
    if (result.isNotEmpty) {
      return new Cliente.fromJson(result.first);
    }
    return null;
  }

  @action
  Future<Cliente?> getClienteByIdPure(int id, Database database) async {
    List<Map<String, dynamic>> result = await database.rawQuery("SELECT * from clientes WHERE id_cliente = $id");
    if (result.isNotEmpty) {
      return new Cliente.fromJson(result.first);
    }
    return null;
  }

  @action
  Future<int> updateCliente(Cliente cliente, Database database) async {
    return await database.update(
      "clientes",
      cliente.toJson(),
      where: "id_cliente = ?",
      whereArgs: [cliente.id_cliente],
    );
  }

  @action
  Future<int> updateClientePure(Cliente cliente, Database database) async {
    return await database.rawUpdate("UPDATE clientes SET nome_cliente = ${cliente.nome_cliente}, "
        " email_cliente = ${cliente.email_cliente}, "
        " celular_cliente = ${cliente.celular_cliente}, "
        " WHERE id_cliente = ${cliente.id_cliente}");
  }

  @action
  Future<int> updateSenhaClientePure(Cliente cliente, Database database) async {
    String senhaCliente = md5.convert(utf8.encode(cliente.senha_cliente!)).toString();
    return await database
        .rawUpdate("UPDATE clientes SET senha_cliente = $senhaCliente WHERE id_cliente = ${cliente.id_cliente}");
  }

  @action
  Future<int> deleteCliente(int id, Database database) async {
    return database.delete("clientes", where: "id_cliente = ?", whereArgs: [id]);
  }

  @action
  Future<int> deleteClientePure(int id, Database database) async {
    return database.rawDelete("DELETE FROM clientes WHERE id_cliente = $id");
  }

  @action
  Future<void> closeDatabase(Database database) async {
    return await database.close();
  }
}
