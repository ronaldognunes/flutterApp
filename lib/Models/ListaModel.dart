import 'package:mobx/mobx.dart';
import 'package:super_lista/Repositories/Tables/ListaTable.dart';
import 'package:super_lista/Util/Util.dart';
part 'ListaModel.g.dart';

class ListaModel extends _ListaModelBase with _$ListaModel{

  ListaModel({
    int idLista,
    String nome,
    int valorTotal,
    int completa,
    int qtdtotal,
    int qtdck
  }):super
      (idLista:idLista,
       nome:nome,
       valorTotal:valorTotal = 0,
       completa:completa,
       qtdtotal:qtdtotal =0,
       qtdck:qtdck = 0);


  @action 
  ListaModel.fromJason( Map<String,dynamic> json){
    idLista = json[ListaTable.idLista];
    nome = json[ListaTable.nome];
    valorTotal = json[ListaTable.valorTotal];
    completa = json[ListaTable.completa];    
  }

  
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data[ListaTable.idLista] = this.idLista;
    data[ListaTable.nome] = this.nome;
    data[ListaTable.valorTotal] = this.valorTotal;
    data[ListaTable.completa] = this.completa;
    return data;
  }

}



abstract class _ListaModelBase with Store {
  
  @observable
  int idLista;

  @observable  
  String nome;

  @observable 
  int valorTotal = 0;

  @observable  
  int completa =0;

  @observable
  int qtdtotal = 0;

  @observable 
  int qtdck = 0;

  @observable
  int qtdaux = 0;

  @computed
  String get valorTotalaux => Util.convertString(valorTotal);
  

  _ListaModelBase({this.idLista,this.nome,this.valorTotal =0,this.completa=0,this.qtdtotal =0,this.qtdck =0 });

  @action
  void onChangeNome(String pnome) {
      nome = pnome;
  }

 
  

}