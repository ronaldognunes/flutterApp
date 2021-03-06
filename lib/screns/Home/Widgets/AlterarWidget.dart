import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:super_lista/Controllers/ListaController.dart';
import 'package:super_lista/Models/ListaModel.dart';

class AlterarWidiget extends StatelessWidget {
  
  final ListaModel lista;
  AlterarWidiget({this.lista});

  @override
  Widget build(BuildContext context) {

    final controller = Provider.of<ListaController>(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), 
      ),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 25),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Inserir Lista',
                      style: TextStyle(fontSize: 18),
                    )
                  ]),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  initialValue: lista==null?'':lista.nome,
                  onChanged: lista.onChangeNome,
                  decoration: InputDecoration(
                      hintText: 'Nome',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton.icon(
                      icon: Icon(Icons.exit_to_app),
                      textColor: Colors.red,
                      label: Text('Sair'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  SizedBox(width: 5),
                  Observer(builder: (_) {
                    return FlatButton.icon(
                        icon: Icon(Icons.save),
                        textColor: Colors.blue,
                        label: Text('Salvar'),
                        onPressed: lista.nome != null
                            ? () {
                                controller.alterarNomeLista(lista);
                                Navigator.of(context).pop();
                              }
                            : null);
                  }),
                  SizedBox(width: 30)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
