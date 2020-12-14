// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListaController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaController on _ListaControllerBase, Store {
  Computed<List<ListaModel>> _$listasGetComputed;

  @override
  List<ListaModel> get listasGet =>
      (_$listasGetComputed ??= Computed<List<ListaModel>>(() => super.listasGet,
              name: '_ListaControllerBase.listasGet'))
          .value;

  final _$listasAtom = Atom(name: '_ListaControllerBase.listas');

  @override
  ObservableList<ListaModel> get listas {
    _$listasAtom.reportRead();
    return super.listas;
  }

  @override
  set listas(ObservableList<ListaModel> value) {
    _$listasAtom.reportWrite(value, super.listas, () {
      super.listas = value;
    });
  }

  final _$filterAtom = Atom(name: '_ListaControllerBase.filter');

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$statusAtom = Atom(name: '_ListaControllerBase.status');

  @override
  ListaStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ListaStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$inserirListaAsyncAction =
      AsyncAction('_ListaControllerBase.inserirLista');

  @override
  Future<dynamic> inserirLista(ListaModel lista) {
    return _$inserirListaAsyncAction.run(() => super.inserirLista(lista));
  }

  final _$iniciarAsyncAction = AsyncAction('_ListaControllerBase.iniciar');

  @override
  Future<dynamic> iniciar() {
    return _$iniciarAsyncAction.run(() => super.iniciar());
  }

  final _$deletarItemAsyncAction =
      AsyncAction('_ListaControllerBase.deletarItem');

  @override
  Future<dynamic> deletarItem(int idx, ListaModel item) {
    return _$deletarItemAsyncAction.run(() => super.deletarItem(idx, item));
  }

  final _$alterarNomeListaAsyncAction =
      AsyncAction('_ListaControllerBase.alterarNomeLista');

  @override
  Future<void> alterarNomeLista(ListaModel lista) {
    return _$alterarNomeListaAsyncAction
        .run(() => super.alterarNomeLista(lista));
  }

  final _$qtdTotalAsyncAction = AsyncAction('_ListaControllerBase.qtdTotal');

  @override
  Future<void> qtdTotal(ListaModel lista) {
    return _$qtdTotalAsyncAction.run(() => super.qtdTotal(lista));
  }

  final _$qtdCheckedAsyncAction =
      AsyncAction('_ListaControllerBase.qtdChecked');

  @override
  Future<void> qtdChecked(ListaModel lista) {
    return _$qtdCheckedAsyncAction.run(() => super.qtdChecked(lista));
  }

  final _$valorTotalAsyncAction =
      AsyncAction('_ListaControllerBase.valorTotal');

  @override
  Future<void> valorTotal(ListaModel lista) {
    return _$valorTotalAsyncAction.run(() => super.valorTotal(lista));
  }

  final _$_ListaControllerBaseActionController =
      ActionController(name: '_ListaControllerBase');

  @override
  void onPesquisa(String pnome) {
    final _$actionInfo = _$_ListaControllerBaseActionController.startAction(
        name: '_ListaControllerBase.onPesquisa');
    try {
      return super.onPesquisa(pnome);
    } finally {
      _$_ListaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listas: ${listas},
filter: ${filter},
status: ${status},
listasGet: ${listasGet}
    ''';
  }
}
