import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:super_lista/Controllers/ItensController.dart';
import 'package:super_lista/Models/ItemModel.dart';
import 'package:super_lista/Models/ListaModel.dart';

class AlterarItem extends StatefulWidget {
  final ItemModel itemController;
  final ListaModel lista;
  AlterarItem({this.itemController, this.lista});

  @override
  _AlterarItemState createState() => _AlterarItemState();
}

class _AlterarItemState extends State<AlterarItem> {
  ItensController controller;
  MoneyMaskedTextController fielValor;
  ItemModel item;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = Provider.of<ItensController>(context);
    item = widget.itemController;
    fielValor = MoneyMaskedTextController();
  }

  @override
  void dispose() {
    super.dispose();
    fielValor.dispose();
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
                      Text('Alterar Item'),
                    ],
                  ),
                ),
                SizedBox(height: 16),
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
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 60,
                      child: Observer(builder: (_) {
                        return TextFormField(
                          onChanged: item.setQtd,
                          inputFormatters: <TextInputFormatter>[
                            LengthLimitingTextInputFormatter(2),
                          ],
                          initialValue: item.qtd.toString(),
                          decoration: InputDecoration(
                            labelText: "Qtd",
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        );
                      }),
                    ),
                    Container(
                      width: 100,
                      child: Observer(builder: (_) {
                        fielValor.text = item.valoraux;
                        return TextFormField(
                          controller: fielValor,
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
                              ? () {
                                  controller.alterarItem(item);
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
