// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$createDatabaseAsyncAction =
      AsyncAction('HomeStoreBase.createDatabase');

  @override
  Future<Database> createDatabase() {
    return _$createDatabaseAsyncAction.run(() => super.createDatabase());
  }

  final _$openMyDatabaseAsyncAction =
      AsyncAction('HomeStoreBase.openMyDatabase');

  @override
  Future<Database> openMyDatabase(String dbPath, int version,
      void Function(Database, int) initializeMethod) {
    return _$openMyDatabaseAsyncAction
        .run(() => super.openMyDatabase(dbPath, version, initializeMethod));
  }

  final _$populateDbAsyncAction = AsyncAction('HomeStoreBase.populateDb');

  @override
  Future populateDb(Database database, int version) {
    return _$populateDbAsyncAction
        .run(() => super.populateDb(database, version));
  }

  final _$createClienteAsyncAction = AsyncAction('HomeStoreBase.createCliente');

  @override
  Future<int> createCliente(Cliente cliente, Database database) {
    return _$createClienteAsyncAction
        .run(() => super.createCliente(cliente, database));
  }

  final _$createClientePureSqlAsyncAction =
      AsyncAction('HomeStoreBase.createClientePureSql');

  @override
  Future<int> createClientePureSql(Cliente cliente, Database database) {
    return _$createClientePureSqlAsyncAction
        .run(() => super.createClientePureSql(cliente, database));
  }

  final _$getAllClientesAsyncAction =
      AsyncAction('HomeStoreBase.getAllClientes');

  @override
  Future<List<dynamic>> getAllClientes(Database database) {
    return _$getAllClientesAsyncAction
        .run(() => super.getAllClientes(database));
  }

  final _$getAllClientesPureAsyncAction =
      AsyncAction('HomeStoreBase.getAllClientesPure');

  @override
  Future<List<dynamic>> getAllClientesPure(Database database) {
    return _$getAllClientesPureAsyncAction
        .run(() => super.getAllClientesPure(database));
  }

  final _$getClienteByIdAsyncAction =
      AsyncAction('HomeStoreBase.getClienteById');

  @override
  Future<Cliente?> getClienteById(int id, Database database) {
    return _$getClienteByIdAsyncAction
        .run(() => super.getClienteById(id, database));
  }

  final _$getClienteByIdPureAsyncAction =
      AsyncAction('HomeStoreBase.getClienteByIdPure');

  @override
  Future<Cliente?> getClienteByIdPure(int id, Database database) {
    return _$getClienteByIdPureAsyncAction
        .run(() => super.getClienteByIdPure(id, database));
  }

  final _$updateClienteAsyncAction = AsyncAction('HomeStoreBase.updateCliente');

  @override
  Future<int> updateCliente(Cliente cliente, Database database) {
    return _$updateClienteAsyncAction
        .run(() => super.updateCliente(cliente, database));
  }

  final _$updateClientePureAsyncAction =
      AsyncAction('HomeStoreBase.updateClientePure');

  @override
  Future<int> updateClientePure(Cliente cliente, Database database) {
    return _$updateClientePureAsyncAction
        .run(() => super.updateClientePure(cliente, database));
  }

  final _$updateSenhaClientePureAsyncAction =
      AsyncAction('HomeStoreBase.updateSenhaClientePure');

  @override
  Future<int> updateSenhaClientePure(Cliente cliente, Database database) {
    return _$updateSenhaClientePureAsyncAction
        .run(() => super.updateSenhaClientePure(cliente, database));
  }

  final _$deleteClienteAsyncAction = AsyncAction('HomeStoreBase.deleteCliente');

  @override
  Future<int> deleteCliente(int id, Database database) {
    return _$deleteClienteAsyncAction
        .run(() => super.deleteCliente(id, database));
  }

  final _$deleteClientePureAsyncAction =
      AsyncAction('HomeStoreBase.deleteClientePure');

  @override
  Future<int> deleteClientePure(int id, Database database) {
    return _$deleteClientePureAsyncAction
        .run(() => super.deleteClientePure(id, database));
  }

  final _$closeDatabaseAsyncAction = AsyncAction('HomeStoreBase.closeDatabase');

  @override
  Future<void> closeDatabase(Database database) {
    return _$closeDatabaseAsyncAction.run(() => super.closeDatabase(database));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
