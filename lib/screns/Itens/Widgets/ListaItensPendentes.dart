import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:super_lista/Controllers/ItensController.dart';
import 'package:super_lista/Models/ListaModel.dart';
import 'package:super_lista/screns/Itens/Widgets/AlterarItem.dart';
import 'package:super_lista/screns/Itens/Widgets/excluir.dart';
import 'package:super_lista/screns/Itens/Widgets/selecionado.dart';

class ListaItensPendentes extends StatefulWidget {
  final ListaModel lista;
  ListaItensPendentes({this.lista});
  @override
  _ListaItensPendentesState createState() => _ListaItensPendentesState();
}

class _ListaItensPendentesState extends State<ListaItensPendentes> {
  ItensController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = Provider.of<ItensController>(context);
    controller.carregarItens(widget.lista.idLista);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final f = NumberFormat("#,##0.00", "pt_BR");
      return Container(
        child: ListView.builder(
            itemCount: controller.listaItens.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == controller.listaItens.length) {
                return Container(height: 40);
              }
              var itemcontroller = controller.listaItens[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                child: Dismissible(
                  direction: DismissDirection.horizontal,
                  onDismissed: (d) {
                    if (d.index == 2) {
                      controller.apagarItem(itemcontroller);
                    } else {
                      itemcontroller.checked(
                          itemcontroller.selecionado == 0 ? true : false);
                      controller.alterarItem(itemcontroller);
                    }
                  },
                  secondaryBackground: Excluir(),
                  background: Selecionado(),
                  key: Key(itemcontroller.nome),
                  child: ListTile(
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlterarItem(
                                lista: widget.lista,
                                itemController: itemcontroller,
                              ));
                    },
                    leading: CircleAvatar(
                        backgroundColor: Colors.indigo,
                        child: Text(
                          '${itemcontroller.nome.substring(0, 1).toUpperCase()}',
                          style: TextStyle(color: Colors.white),
                        )),
                    title: Observer(builder: (_) {
                      return Text(
                        itemcontroller.nome.toUpperCase(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: itemcontroller.selecionado == 0
                                ? TextDecoration.none
                                : TextDecoration.lineThrough),
                      );
                    }),
                    subtitle: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Qtd:',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo),
                        ),
                        Text(
                          '${itemcontroller.qtd}',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo),
                        ),
                        SizedBox(width: 30),
                        Text(
                          'Valor:',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo),
                        ),
                        Text(
                          'R\$${f.format(itemcontroller.valorTotal / 100).toString()}',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo),
                        ),
                      ],
                    ),
                    trailing: Material(
                      elevation: 6,
                      borderRadius: BorderRadius.circular(30),
                      child: Icon(Icons.swap_horizontal_circle,
                          size: 30, color: Colors.teal),
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }
}
