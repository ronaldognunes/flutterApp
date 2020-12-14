// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemModel on _ItemModelBase, Store {
  Computed<bool> _$validaComputed;

  @override
  bool get valida => (_$validaComputed ??=
          Computed<bool>(() => super.valida, name: '_ItemModelBase.valida'))
      .value;

  final _$idListaAtom = Atom(name: '_ItemModelBase.idLista');

  @override
  int get idLista {
    _$idListaAtom.reportRead();
    return super.idLista;
  }

  @override
  set idLista(int value) {
    _$idListaAtom.reportWrite(value, super.idLista, () {
      super.idLista = value;
    });
  }

  final _$idItemAtom = Atom(name: '_ItemModelBase.idItem');

  @override
  int get idItem {
    _$idItemAtom.reportRead();
    return super.idItem;
  }

  @override
  set idItem(int value) {
    _$idItemAtom.reportWrite(value, super.idItem, () {
      super.idItem = value;
    });
  }

  final _$nomeAtom = Atom(name: '_ItemModelBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$qtdAtom = Atom(name: '_ItemModelBase.qtd');

  @override
  int get qtd {
    _$qtdAtom.reportRead();
    return super.qtd;
  }

  @override
  set qtd(int value) {
    _$qtdAtom.reportWrite(value, super.qtd, () {
      super.qtd = value;
    });
  }

  final _$valorAtom = Atom(name: '_ItemModelBase.valor');

  @override
  int get valor {
    _$valorAtom.reportRead();
    return super.valor;
  }

  @override
  set valor(int value) {
    _$valorAtom.reportWrite(value, super.valor, () {
      super.valor = value;
    });
  }

  final _$valorTotalAtom = Atom(name: '_ItemModelBase.valorTotal');

  @override
  int get valorTotal {
    _$valorTotalAtom.reportRead();
    return super.valorTotal;
  }

  @override
  set valorTotal(int value) {
    _$valorTotalAtom.reportWrite(value, super.valorTotal, () {
      super.valorTotal = value;
    });
  }

  final _$selecionadoAtom = Atom(name: '_ItemModelBase.selecionado');

  @override
  int get selecionado {
    _$selecionadoAtom.reportRead();
    return super.selecionado;
  }

  @override
  set selecionado(int value) {
    _$selecionadoAtom.reportWrite(value, super.selecionado, () {
      super.selecionado = value;
    });
  }

  final _$valorauxAtom = Atom(name: '_ItemModelBase.valoraux');

  @override
  String get valoraux {
    _$valorauxAtom.reportRead();
    return super.valoraux;
  }

  @override
  set valoraux(String value) {
    _$valorauxAtom.reportWrite(value, super.valoraux, () {
      super.valoraux = value;
    });
  }

  final _$_ItemModelBaseActionController =
      ActionController(name: '_ItemModelBase');

  @override
  void setNome(String v) {
    final _$actionInfo = _$_ItemModelBaseActionController.startAction(
        name: '_ItemModelBase.setNome');
    try {
      return super.setNome(v);
    } finally {
      _$_ItemModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQtd(String v) {
    final _$actionInfo = _$_ItemModelBaseActionController.startAction(
        name: '_ItemModelBase.setQtd');
    try {
      return super.setQtd(v);
    } finally {
      _$_ItemModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValor(String v) {
    final _$actionInfo = _$_ItemModelBaseActionController.startAction(
        name: '_ItemModelBase.setValor');
    try {
      return super.setValor(v);
    } finally {
      _$_ItemModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checked(bool v) {
    final _$actionInfo = _$_ItemModelBaseActionController.startAction(
        name: '_ItemModelBase.checked');
    try {
      return super.checked(v);
    } finally {
      _$_ItemModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idLista: ${idLista},
idItem: ${idItem},
nome: ${nome},
qtd: ${qtd},
valor: ${valor},
valorTotal: ${valorTotal},
selecionado: ${selecionado},
valoraux: ${valoraux},
valida: ${valida}
    ''';
  }
}
