import 'package:mobx/mobx.dart';
import 'package:super_lista/Models/ListaModel.dart';
import 'package:super_lista/Repositories/DbContext.dart';
part 'ListaController.g.dart';

enum ListaStatus { carregando, pronto }

class ListaController = _ListaControllerBase with _$ListaController;

abstract class _ListaControllerBase with Store {
  final _db = DbContext.db;

  @observable
  ObservableList<ListaModel> listas = ObservableList<ListaModel>();

  @observable
  String filter = '';

  @observable
  ListaStatus status = ListaStatus.carregando;

  @action
  Future inserirLista(ListaModel lista) async {
    lista.idLista = await _db.inserirLista(lista);
    listas.insert(0, lista);
  }

  @action
  Future iniciar() async {
    var result = await _db.todasListas();
    listas = ObservableList.of(result);
    status = ListaStatus.pronto;
  }

  @action
  Future deletarItem(int idx, ListaModel item) async {
    await _db.apagarLista(item.idLista);
    await _db.apagarTodosItens(item.idLista);
    listas.removeAt(idx);
  }

  @action
  void onPesquisa(String pnome) => filter = pnome;

  @computed
  List<ListaModel> get listasGet {
    if (filter.isNotEmpty) {
      return listas
          .where((p) => p.nome.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    } else {
      return listas;
    }
  }

  @action
  Future<void> alterarNomeLista(ListaModel lista) async {
    await _db.atualizarLista(lista);
    final idx = listas.indexWhere((l) => l.idLista == lista.idLista);
    listas.removeAt(idx);
    listas.insert(idx, lista);
  }

  @action
  Future<void> qtdTotal(ListaModel lista) async {
    final result = await _db.buscaItens(lista.idLista);
    var qtdtotal = 0;
    result.forEach((f) => qtdtotal += f.qtd);
    lista.qtdtotal = qtdtotal;
  }

  @action
  Future<void> qtdChecked(ListaModel lista) async {
    final result = await _db.buscaItens(lista.idLista);
    var qtdChecked = 0;
    result.forEach((f) {
      if (f.selecionado == 1) {
        qtdChecked += f.qtd;
      }
    });
    lista.qtdck = qtdChecked;
  }

  @action
  Future<void> valorTotal(ListaModel lista) async {
    final result = await _db.buscaItens(lista.idLista);
    var valorTotal = 0;
    result.forEach((f) {
      valorTotal += f.valorTotal;
    });
    lista.valorTotal = valorTotal;
  }

  Future<void> atualizarLista(ListaModel lista) async {
    await valorTotal(lista);
    await qtdChecked(lista);
    await qtdTotal(lista);
  }
}
