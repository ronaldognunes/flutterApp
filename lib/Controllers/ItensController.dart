import 'package:mobx/mobx.dart';
import 'package:super_lista/Models/ItemModel.dart';
import 'package:super_lista/Repositories/DbContext.dart';
import 'package:super_lista/Service/speech.dart';
import 'package:super_lista/Util/Util.dart';
part 'ItensController.g.dart';

class ItensController = _ItensControllerBase with _$ItensController;

abstract class _ItensControllerBase with Store {
  DbContext db = DbContext.db;

  @observable
  Speech speech = Speech();

  @observable
  ObservableList<ItemModel> itensController = ObservableList<ItemModel>();

  @action
  Future<void> carregarItens(int id) async {
    var result = await db.buscaItens(id);
    List<ItemModel> itens = [];
    for (var item in result) {
      item.valoraux = Util.convertString(item.valor);
      itens.add(item);
    }
    itensController = ObservableList.of(itens);
  }

  @observable
  bool orderP = false;

  @observable
  bool orderC = false;

  @computed
  List<ItemModel> get listaItens {
    if (orderP) {
      Comparator<ItemModel> comparador = (a, b) => a.nome.compareTo(b.nome);
      List<ItemModel> itens =
          itensController.where((p) => p.selecionado == 0).toList();
      itens.sort(comparador);
      return itens.toList();
    }
    return itensController.reversed.where((p) => p.selecionado == 0).toList();
  }

  @computed
  List<ItemModel> get listaCarrinho {
    if (orderC) {
      Comparator<ItemModel> comparator = (a, b) => a.nome.compareTo(b.nome);
      List<ItemModel> itens =
          itensController.reversed.where((c) => c.selecionado == 1).toList();
      itens.sort(comparator);
      return itens.toList();
    }
    return itensController.reversed.where((c) => c.selecionado == 1).toList();
  }

  @action
  void orderPendentes(bool orderP) {
    this.orderP = !orderP;
  }

  void orderCarrinho(bool orderC) {
    this.orderC = !orderC;
  }

  @action
  Future<void> inserirItem(ItemModel itemcontroller) async {
    itemcontroller.valor = Util.convertInt(itemcontroller.valoraux);
    itemcontroller.valorTotal = itemcontroller.qtd * itemcontroller.valor;
    final idItem = await db.inserirItem(itemcontroller);
    itemcontroller.idItem = idItem;
    itensController.add(itemcontroller);
  }

  @action
  Future<void> apagarItem(ItemModel itemcontroller) async {
    itensController.removeWhere((v) => v.idItem == itemcontroller.idItem);
    await db.apagarItem(itemcontroller.idItem);
  }

  @action
  Future<void> alterarItem(ItemModel itemcontroller) async {
    itemcontroller.valor = Util.convertInt(itemcontroller.valoraux);
    itemcontroller.valorTotal = itemcontroller.qtd * itemcontroller.valor;
    final idx =
        itensController.indexWhere((i) => i.idItem == itemcontroller.idItem);
    itensController.removeAt(idx);
    await db.atualizarItem(itemcontroller);
    itensController.insert(idx, itemcontroller);
  }

  @action
  Future<void> removerDoCarrinho() async {
    for (var item in listaCarrinho) {
      item.selecionado = 0;
      await db.atualizarItem(item);
    }
  }

  @action
  Future<void> apagarTodosItens(int idLista) async {
    await db.apagarTodosItens(idLista);
    await carregarItens(idLista);
  }

  /*reconhecimento de voz*/

  @computed
  String get result => speech.lastWords;

  @computed
  String get status => speech.lastStatus;

  @action
  void iniSpeech() {
    speech.initSpeechState();
  }

  void starSpeech() {
    speech.startListening();
  }
}
