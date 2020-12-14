import 'package:flutter/material.dart';

class Excluir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:<Widget>[
            SizedBox(
              width:20
            ),
            Icon(
              Icons.delete_sweep,
              color: Colors.white,
            ),
            Text(
              "Excluir",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700
              ),
              textAlign: TextAlign.left
            ),
            SizedBox(width:20),
          ]
        ),
        alignment: Alignment.center,
      ),
      
    );
  }
}