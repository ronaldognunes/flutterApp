import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:super_lista/Controllers/ItensController.dart';
import 'package:super_lista/Models/ItemModel.dart';
import 'package:super_lista/Models/ListaModel.dart';

class InserirItem extends StatefulWidget {
  final ListaModel lista;

  InserirItem({this.lista});

  @override
  _InserirItemState createState() => _InserirItemState();
}

class _InserirItemState extends State<InserirItem> {
  ItensController controller;
  ItemModel item;
  MoneyMaskedTextController fieldValor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = Provider.of<ItensController>(context);
    item = ItemModel(idLista: widget.lista.idLista);
    fieldValor = MoneyMaskedTextController();
  }

  @override
  void dispose() {
    fieldValor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text('Inserir Novo Item'),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Observer(builder: (_) {
                  return TextFormField(
                    initialValue: item.nome,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(30),
                    ],
                    onChanged: item.setNome,
                    decoration: InputDecoration(
                        labelText: "Nome", border: OutlineInputBorder()),
                  );
                }),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 60,
                      child: Observer(builder: (_) {
                        return TextFormField(
                          initialValue: item.qtd.toString(),
                          onChanged: item.setQtd,
                          decoration: InputDecoration(
                            labelText: "Qtd",
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(2),
                          ],
                        );
                      }),
                    ),
                    Container(
                      width: 100,
                      child: Observer(builder: (_) {
                        fieldValor.text = item.valoraux;
                        return TextFormField(
                          controller: fieldValor,
                          onChanged: item.setValor,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(8),
                          ],
                          decoration: InputDecoration(
                              labelText: "Valor", border: OutlineInputBorder()),
                          keyboardType: TextInputType.number,
                        );
                      }),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FlatButton.icon(
                        textColor: Colors.red,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.exit_to_app),
                        label: Text('Sair')),
                    SizedBox(width: 8),
                    Observer(builder: (_) {
                      return FlatButton.icon(
                          textColor: Colors.blue,
                          onPressed: item.valida
                              ? () async {
                                  await controller.inserirItem(item);
                                  Navigator.of(context).pop();
                                }
                              : null,
                          icon: Icon(Icons.save),
                          label: Text('Salvar'));
                    }),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
