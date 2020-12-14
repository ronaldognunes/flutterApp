import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:super_lista/Controllers/ListaController.dart';
import 'package:super_lista/Models/ListaModel.dart';
import 'package:super_lista/screns/Home/Widgets/OpcoesWidiget.dart';
import 'package:super_lista/screns/Itens/ItensScrenn.dart';

class ListaWidget extends StatelessWidget {
  final ListaModel lista;
  final int idx;

  ListaWidget({this.lista, this.idx});
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ListaController>(context);
    controller.atualizarLista(lista);
    final f = NumberFormat("#,##0.00", "pt_BR");

    Widget textform(String text) {
      return Text(
        text,
        style: TextStyle(
            color: Colors.black, fontSize: 16.0, fontStyle: FontStyle.italic),
      );
    }

    void _bottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return OpcoesWidiget(idx, lista);
        },
      );
    }

    return GestureDetector(
      onLongPress: () {
        _bottomSheet();
      },
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItensScrenn(
                      lista: lista,
                    ))).then((value) => controller.atualizarLista(lista));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        color: Colors.grey[200],
        child: Container(
          padding: EdgeInsets.all(16),
          height: 250,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    lista.nome.toUpperCase(),
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  textform('Valor da Lista:'),
                  Observer(
                      builder: (_) => Chip(
                          backgroundColor: Colors.yellow,
                          elevation: 8,
                          label: textform(
                              'R\$:${f.format(lista.valorTotal / 100).toString()}'))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  textform('Qtd de Total de Itens:'),
                  Observer(
                      builder: (_) => Chip(
                          backgroundColor: Colors.indigo,
                          elevation: 8,
                          label: textform(lista.qtdtotal.toString()))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  textform('Qtd de Itens no Carrinho:'),
                  Observer(
                      builder: (_) => Chip(
                          backgroundColor: Colors.green,
                          elevation: 8,
                          label: textform(lista.qtdck.toString()))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
