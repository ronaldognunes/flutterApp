import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:super_lista/Controllers/ListaController.dart';
import 'package:super_lista/screns/Home/Widgets/InserirLista.dart';
import 'package:super_lista/screns/Home/Widgets/ListaVazia.dart';
import 'package:super_lista/screns/Home/Widgets/ListaWidget.dart';
import 'package:super_lista/screns/Tutorial/tutorial.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListaController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
    controller = Provider.of<ListaController>(context)..iniciar();
  }

  @override
  Widget build(BuildContext context) {
    void _bottomSheat() {
      showDialog(
        context: context,
        builder: (BuildContext bc) {
          return InserirLista();
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        splashColor: Colors.orange,
        child: Icon(Icons.add),
        onPressed: () {
          _bottomSheat();
        },
      ),
      body: Stack(children: <Widget>[
        Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.indigo, Colors.cyanAccent],
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight),
        )),
        Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 16,
            right: 16,
            bottom: 30,
          ),
          child: Column(children: <Widget>[
            FlatButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => TutorialPage()));
              },
              icon: Icon(
                Icons.help,
                color: Colors.redAccent,
              ),
              label: Text('Manual de uso'),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 16, bottom: 16),
                  child: TextField(
                    onChanged: controller.onPesquisa,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Material(
                          color: Colors.white,
                          child: Icon(Icons.search),
                        ),
                        hintText: "Pesquisar"),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Observer(builder: (_) {
                if (controller.status == ListaStatus.carregando) {
                  return Center(
                    child: CircularProgressIndicator(
                        backgroundColor: Colors.white),
                  );
                }
                if (controller.listasGet.length == 0) {
                  return ListaVazia();
                }
                return ListView.builder(
                    itemCount: controller.listasGet.length,
                    itemBuilder: (ctx, index) {
                      var lista = controller.listasGet[index];
                      return ListaWidget(lista: lista, idx: index);
                    });
              }),
            ),
          ]),
        )
      ]),
    );
  }
}
