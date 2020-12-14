import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_lista/Controllers/ListaController.dart';
import 'package:super_lista/Models/ListaModel.dart';
import 'package:super_lista/screns/Home/Widgets/AlterarWidget.dart';

class OpcoesWidiget extends StatelessWidget {
  
  final int idx;
  final ListaModel item;
  OpcoesWidiget(this.idx,this.item);
  @override
  Widget build(BuildContext context) {

    ListaController controller = Provider.of<ListaController>(context);
    return  Column(
            mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(
              "Deletar",
            ),
            trailing: Icon(Icons.delete),
            onTap: () {
              controller.deletarItem(idx,item);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text(
              "Alterar",
            ),
            trailing: Icon(Icons.update),
            onTap: (){
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlterarWidiget(lista: item,);
                },
              );
              
            }
          ),
          SizedBox(height: 30,)
        ],
      );
  }
}
