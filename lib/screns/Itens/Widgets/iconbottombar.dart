import 'package:flutter/material.dart';

class IconBottomBar extends StatelessWidget {
  final Icon icon;
  final String text;
  final ck ;
  final VoidCallback voidCallback;

  const IconBottomBar({Key key, this.icon, this.text, this.ck, this.voidCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 50,
      child: GestureDetector(
        onTap:voidCallback
        ,
        child: Column(children: <Widget>[
          icon,
          Text(
            '$text',
            style: TextStyle(color: ck? Colors.blue: Colors.black),
          ),
        ]),
      ),
    );
  }
}
