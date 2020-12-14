import 'package:flutter/material.dart';

class Selecionado extends StatelessWidget {
  final bool tipo;

  const Selecionado({Key key, this.tipo = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: tipo?Colors.indigo:Colors.green,
      child: Align(
        child: Row(
          children:<Widget>[
            SizedBox(
              width:20
            ),
            Icon(tipo? Icons.remove_shopping_cart:
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            Text(tipo?"Retirar do carrinho":
              "Adicionar Carrinho",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700
              ),
              textAlign: TextAlign.left,
            )
          ]
        ),
        alignment: Alignment.center,
      ),
      
    );
  }
}