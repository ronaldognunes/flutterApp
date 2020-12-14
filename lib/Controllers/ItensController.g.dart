// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItensController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItensController on _ItensControllerBase, Store {
  Computed<List<ItemModel>> _$listaItensComputed;

  @override
  List<ItemModel> get listaItens => (_$listaItensComputed ??=
          Computed<List<ItemModel>>(() => super.listaItens,
              name: '_ItensControllerBase.listaItens'))
      .value;
  Computed<List<ItemModel>> _$listaCarrinhoComputed;

  @override
  List<ItemModel> get listaCarrinho => (_$listaCarrinhoComputed ??=
          Computed<List<ItemModel>>(() => super.listaCarrinho,
              name: '_ItensControllerBase.listaCarrinho'))
      .value;
  Computed<String> _$resultComputed;

  @override
  String get result =>
      (_$resultComputed ??= Computed<String>(() => super.result,
              name: '_ItensControllerBase.result'))
          .value;
  Computed<String> _$statusComputed;

  @override
  String get status =>
      (_$statusComputed ??= Computed<String>(() => super.status,
              name: '_ItensControllerBase.status'))
          .value;

  final _$speechAtom = Atom(name: '_ItensControllerBase.speech');

  @override
  Speech get speech {
    _$speechAtom.reportRead();
    return super.speech;
  }

  @override
  set speech(Speech value) {
    _$speechAtom.reportWrite(value, super.speech, () {
      super.speech = value;
    });
  }

  final _$itensControllerAtom =
      Atom(name: '_ItensControllerBase.itensController');

  @override
  ObservableList<ItemModel> get itensController {
    _$itensControllerAtom.reportRead();
    return super.itensController;
  }

  @override
  set itensController(ObservableList<ItemModel> value) {
    _$itensControllerAtom.reportWrite(value, super.itensController, () {
      super.itensController = value;
    });
  }

  final _$orderPAtom = Atom(name: '_ItensControllerBase.orderP');

  @override
  bool get orderP {
    _$orderPAtom.reportRead();
    return super.orderP;
  }

  @override
  set orderP(bool value) {
    _$orderPAtom.reportWrite(value, super.orderP, () {
      super.orderP = value;
    });
  }

  final _$orderCAtom = Atom(name: '_ItensControllerBase.orderC');

  @override
  bool get orderC {
    _$orderCAtom.reportRead();
    return super.orderC;
  }

  @override
  set orderC(bool value) {
    _$orderCAtom.reportWrite(value, super.orderC, () {
      super.orderC = value;
    });
  }

  final _$carregarItensAsyncAction =
      AsyncAction('_ItensControllerBase.carregarItens');

  @override
  Future<void> carregarItens(int id) {
    return _$carregarItensAsyncAction.run(() => super.carregarItens(id));
  }

  final _$inserirItemAsyncAction =
      AsyncAction('_ItensControllerBase.inserirItem');

  @override
  Future<void> inserirItem(ItemModel itemcontroller) {
    return _$inserirItemAsyncAction
        .run(() => super.inserirItem(itemcontroller));
  }

  final _$apagarItemAsyncAction =
      AsyncAction('_ItensControllerBase.apagarItem');

  @override
  Future<void> apagarItem(ItemModel itemcontroller) {
    return _$apagarItemAsyncAction.run(() => super.apagarItem(itemcontroller));
  }

  final _$alterarItemAsyncAction =
      AsyncAction('_ItensControllerBase.alterarItem');

  @override
  Future<void> alterarItem(ItemModel itemcontroller) {
    return _$alterarItemAsyncAction
        .run(() => super.alterarItem(itemcontroller));
  }

  final _$removerDoCarrinhoAsyncAction =
      AsyncAction('_ItensControllerBase.removerDoCarrinho');

  @override
  Future<void> removerDoCarrinho() {
    return _$removerDoCarrinhoAsyncAction.run(() => super.removerDoCarrinho());
  }

  final _$apagarTodosItensAsyncAction =
      AsyncAction('_ItensControllerBase.apagarTodosItens');

  @override
  Future<void> apagarTodosItens(int idLista) {
    return _$apagarTodosItensAsyncAction
        .run(() => super.apagarTodosItens(idLista));
  }

  final _$_ItensControllerBaseActionController =
      ActionController(name: '_ItensControllerBase');

  @override
  void orderPendentes(bool orderP) {
    final _$actionInfo = _$_ItensControllerBaseActionController.startAction(
        name: '_ItensControllerBase.orderPendentes');
    try {
      return super.orderPendentes(orderP);
    } finally {
      _$_ItensControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void iniSpeech() {
    final _$actionInfo = _$_ItensControllerBaseActionController.startAction(
        name: '_ItensControllerBase.iniSpeech');
    try {
      return super.iniSpeech();
    } finally {
      _$_ItensControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
speech: ${speech},
itensController: ${itensController},
orderP: ${orderP},
orderC: ${orderC},
listaItens: ${listaItens},
listaCarrinho: ${listaCarrinho},
result: ${result},
status: ${status}
    ''';
  }
}
