// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListaModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaModel on _ListaModelBase, Store {
  Computed<String> _$valorTotalauxComputed;

  @override
  String get valorTotalaux =>
      (_$valorTotalauxComputed ??= Computed<String>(() => super.valorTotalaux,
              name: '_ListaModelBase.valorTotalaux'))
          .value;

  final _$idListaAtom = Atom(name: '_ListaModelBase.idLista');

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

  final _$nomeAtom = Atom(name: '_ListaModelBase.nome');

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

  final _$valorTotalAtom = Atom(name: '_ListaModelBase.valorTotal');

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

  final _$completaAtom = Atom(name: '_ListaModelBase.completa');

  @override
  int get completa {
    _$completaAtom.reportRead();
    return super.completa;
  }

  @override
  set completa(int value) {
    _$completaAtom.reportWrite(value, super.completa, () {
      super.completa = value;
    });
  }

  final _$qtdtotalAtom = Atom(name: '_ListaModelBase.qtdtotal');

  @override
  int get qtdtotal {
    _$qtdtotalAtom.reportRead();
    return super.qtdtotal;
  }

  @override
  set qtdtotal(int value) {
    _$qtdtotalAtom.reportWrite(value, super.qtdtotal, () {
      super.qtdtotal = value;
    });
  }

  final _$qtdckAtom = Atom(name: '_ListaModelBase.qtdck');

  @override
  int get qtdck {
    _$qtdckAtom.reportRead();
    return super.qtdck;
  }

  @override
  set qtdck(int value) {
    _$qtdckAtom.reportWrite(value, super.qtdck, () {
      super.qtdck = value;
    });
  }

  final _$qtdauxAtom = Atom(name: '_ListaModelBase.qtdaux');

  @override
  int get qtdaux {
    _$qtdauxAtom.reportRead();
    return super.qtdaux;
  }

  @override
  set qtdaux(int value) {
    _$qtdauxAtom.reportWrite(value, super.qtdaux, () {
      super.qtdaux = value;
    });
  }

  final _$_ListaModelBaseActionController =
      ActionController(name: '_ListaModelBase');

  @override
  void onChangeNome(String pnome) {
    final _$actionInfo = _$_ListaModelBaseActionController.startAction(
        name: '_ListaModelBase.onChangeNome');
    try {
      return super.onChangeNome(pnome);
    } finally {
      _$_ListaModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idLista: ${idLista},
nome: ${nome},
valorTotal: ${valorTotal},
completa: ${completa},
qtdtotal: ${qtdtotal},
qtdck: ${qtdck},
qtdaux: ${qtdaux},
valorTotalaux: ${valorTotalaux}
    ''';
  }
}
