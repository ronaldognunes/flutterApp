
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_lista/Controllers/ItensController.dart';
import 'package:super_lista/Controllers/ListaController.dart';
import 'package:super_lista/Splash/Splash.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
          home:Splash()
        ),
        providers: [
          Provider<ListaController>(create: (_) => ListaController()),
          Provider<ItensController>(create: (_) => ItensController()),
        ]);
  }
}
