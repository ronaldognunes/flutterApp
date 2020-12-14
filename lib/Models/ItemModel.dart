import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:super_lista/Repositories/Tables/ItemTable.dart';
part 'ItemModel.g.dart';

class ItemModel extends _ItemModelBase with _$ItemModel {
  ItemModel({
    @required int idLista,
    int idItem,
    String nome,
    int qtd = 1,
    int selecionado = 0,
    int valor = 0,
    int valorTotal,
  }) : super(
            idLista: idLista,
            idItem: idItem,
            nome: nome,
            qtd: qtd,
            selecionado: selecionado,
            valor: valor,
            valorTotal: valorTotal);

  ItemModel.fromJson(Map<String, dynamic> json) {
    idLista = json[ItemTable.idLista];
    idItem = json[ItemTable.idItem];
    nome = json[ItemTable.nomeItem];
    qtd = json[ItemTable.qtd];
    valor = json[ItemTable.valor];
    valorTotal = json[ItemTable.valorTotal];
    selecionado = json[ItemTable.selecionado];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[ItemTable.idLista] = this.idLista;
    data[ItemTable.idItem] = this.idItem;
    data[ItemTable.nomeItem] = this.nome;
    data[ItemTable.qtd] = this.qtd;
    data[ItemTable.valor] = this.valor;
    data[ItemTable.valorTotal] = this.qtd * this.valor;
    data[ItemTable.selecionado] = this.selecionado;
    return data;
  }
}

abstract class _ItemModelBase with Store {
  @observable
  int idLista;

  @observable
  int idItem;

  @observable
  String nome;

  @observable
  int qtd;

  @observable
  int valor;

  @observable
  int valorTotal;

  @observable
  int selecionado;

  @observable
  String valoraux = '0,00';

  _ItemModelBase({
    @required this.idLista,
    this.idItem,
    this.nome,
    this.qtd,
    this.selecionado,
    this.valor,
    this.valorTotal,
  });

  @action
  void setNome(String v) => nome = v;

  @action
  void setQtd(String v) => qtd = int.parse(v);

  @action
  void setValor(String v) => valoraux = v;

  @computed
  bool get valida => nome == null ? false : true;
  @action
  void checked(bool v) => v ? selecionado = 1 : selecionado = 0;
}
