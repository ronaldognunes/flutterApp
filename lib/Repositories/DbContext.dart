import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:super_lista/Models/ItemModel.dart';
import 'package:super_lista/Models/ListaModel.dart';

import 'Tables/ItemTable.dart';
import 'Tables/ListaTable.dart';

class DbContext {
  DbContext._();
  static final DbContext db = DbContext._();
  static Database _database;
  static final String _tabelaLista = "CREATE TABLE ${ListaTable.tabela}("
      "${ListaTable.idLista} INTEGER PRIMARY KEY,"
      "${ListaTable.nome} TEXT,"
      "${ListaTable.completa} INTEGER,"
      "${ListaTable.valorTotal} INTEGER)";

  static final String _tabelaItem = "CREATE TABLE ${ItemTable.tabela}("
      "${ItemTable.idItem} INTEGER PRIMARY KEY,"
      "${ItemTable.idLista} INTEGER,"
      "${ItemTable.nomeItem} TEXT,"
      "${ItemTable.qtd} INTEGER,"
      "${ItemTable.selecionado} INTERGER,"
      "${ItemTable.valor} INTEGER,"
      "${ItemTable.valorTotal} INTEGER)";

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory diretorio = await getApplicationDocumentsDirectory();
    String path = '${diretorio.path}superLista.db';
    return await openDatabase(path, version: 1, onCreate: (db, v) async {
      await db.execute(_tabelaLista);
      await db.execute(_tabelaItem);
    });
  }

  Future<int> inserirLista(ListaModel lista) async {
    final db = await database;
    var result = await db.insert(ListaTable.tabela, lista.toJson());
    return result;
  }

  Future<ListaModel> consultaLista(int idLista) async {
    final db = await database;
    var result = await db.query(ListaTable.tabela,
        where: "${ListaTable.idLista} =?", whereArgs: [idLista]);
    if(result.isNotEmpty){
      ListaModel lista = ListaModel.fromJason(result.first);
      lista.qtdtotal = await buscaItensTotais(lista.idLista);
      lista.qtdck = await buscaTotalItensCk(lista.idLista);
      lista.valorTotal = await buscaItensValorTot(lista.idLista);
      return lista;
    }
    return ListaModel();
  }

  Future<List<ListaModel>> todasListas() async {
    final db = await database;
    var result = await db.query(ListaTable.tabela);
    List<ListaModel> listas = result.isNotEmpty
        ? result.map((c) => ListaModel.fromJason(c)).toList()
        : [];
    listas.forEach((l) async {
      l.qtdtotal = await buscaItensTotais(l.idLista);
      l.qtdck = await buscaTotalItensCk(l.idLista);
      l.valorTotal = await buscaItensValorTot(l.idLista);
    });        
    return listas;
  }

  Future<int> apagarLista(int idLista) async {
    final db = await database;
    var result = db.delete(ListaTable.tabela,
        where: "${ListaTable.idLista} = ?", whereArgs: [idLista]);
    return result;
  }

  Future<int> atualizarLista(ListaModel lista) async {
    final db = await database;
    var result = await db.update(ListaTable.tabela, lista.toJson(),
        where: "${ListaTable.idLista} =?", whereArgs: [lista.idLista]);
    return result;
  }

  Future<int> inserirItem(ItemModel item) async {
    final db = await database;
    var result = await db.insert(ItemTable.tabela, item.toJson());
    return result;
  }

  Future<int> atualizarItem(ItemModel item) async {
    final db = await database;
    var result = await db.update(ItemTable.tabela, item.toJson(),
        where: "${ItemTable.idItem} = ?", whereArgs: [item.idItem]);
    return result;
  }

  Future<List<ItemModel>> buscaItens(int idLista) async {
    final db = await database;
    var result = await db.query(ItemTable.tabela,
        where: "${ItemTable.idLista} = ?", whereArgs: [idLista]);
    List<ItemModel> itens = result.isNotEmpty
        ? result.map((i) => ItemModel.fromJson(i)).toList()
        : [];
    return itens;
  }

  Future<int> apagarItem(int idItem) async {
    final db = await database;
    var result = await db.delete(ItemTable.tabela,
        where: "${ItemTable.idItem} = ?", whereArgs: [idItem]);
    return result;
  }

  Future<int> apagarTodosItens(int idLista) async {
    final db = await database;
    var result = await db.delete(ItemTable.tabela,
        where: "${ItemTable.idLista} = ?", whereArgs: [idLista]);
    return result;
  }

  Future<int> buscaItensTotais(int idLista) async {
    final List<ItemModel> listaitens = await buscaItens(idLista);
    int total = 0;
    listaitens.forEach((i) {
      total += i.qtd;
    });
    return total;
  }

  Future<int> buscaTotalItensCk(int idLista) async {
    final List<ItemModel> listaitens = await buscaItens(idLista);
    int total = 0;
    listaitens.forEach((i) {
      if (i.selecionado == 1) {
        total += i.qtd;
      }
    });
    return total;

  }

  Future<int> buscaItensValorTot(int idLista) async{
     final List<ItemModel> listaitens = await buscaItens(idLista);
    int total = 0;
    listaitens.forEach((i) {      
        total += i.valorTotal;      
    });
    return total;
   } 
}
