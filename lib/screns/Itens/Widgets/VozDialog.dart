import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:super_lista/Controllers/ItensController.dart';
import 'package:super_lista/Models/ItemModel.dart';

class VozDialog extends StatefulWidget {
  final int idLista;

  const VozDialog({Key key, this.idLista}) : super(key: key);
  @override
  _VozDialogState createState() => _VozDialogState();
}

class _VozDialogState extends State<VozDialog> {
  ItensController controller;
  ReactionDisposer reactionDisposer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    reactionDisposer.reaction.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = Provider.of<ItensController>(context);
    controller.iniSpeech();
    reactionDisposer =
        reaction<bool>((_) => controller.speech.salvar, (status) {
      if (controller.speech.salvar) {
        var item = ItemModel(idLista: widget.idLista, nome: controller.result);
        controller.inserirItem(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Observer(builder: (_) {
              return Text(
                controller.status == "listening"
                    ? 'Ouvindo...'
                    : 'Aperte para Falar',
                style: TextStyle(
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontStyle: FontStyle.italic),
              );
            }),
            SizedBox(height: 20),
            Observer(builder: (_) {
              return Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: .26,
                          spreadRadius: controller.speech.level * 1.5,
                          color: Colors.black.withOpacity(.05))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Observer(builder: (_) {
                    return IconButton(
                      icon: Icon(
                        Icons.mic,
                        size: 45,
                        color: controller.status == "listening"
                            ? Colors.redAccent
                            : Colors.black,
                      ),
                      onPressed: () {
                        controller.starSpeech();
                      },
                    );
                  }));
            }),
            SizedBox(height: 20),
            Observer(builder: (_) {
              return Text(
                controller.result,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontStyle: FontStyle.italic),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Sair',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
