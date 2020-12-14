import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_lista/Controllers/ItensController.dart';
import 'package:super_lista/Models/ListaModel.dart';
import 'package:super_lista/screns/Itens/Widgets/InserirItem.dart';
import 'package:super_lista/screns/Itens/Widgets/ListaItensCarrinho.dart';
import 'package:super_lista/screns/Itens/Widgets/ListaItensPendentes.dart';
import 'package:super_lista/screns/Itens/Widgets/VozDialog.dart';
import 'package:super_lista/screns/Itens/Widgets/iconbottombar.dart';

class ItensScrenn extends StatefulWidget {
  final ListaModel lista;
  @override
  _ItensScrennState createState() => _ItensScrennState();

  ItensScrenn({this.lista});
}

class _ItensScrennState extends State<ItensScrenn> {
  ItensController controller;
  PageController pageController;
  List<Widget> pages = [];
  int page = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: page);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = Provider.of<ItensController>(context);
    pages
      ..add(ListaItensPendentes(lista: widget.lista))
      ..add(ListaItensCarrinho(lista: widget.lista));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(page == 0 ? 'Pendentes' : 'Carrinho'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.sort_by_alpha),
              onPressed: () {
                if (page == 0) {
                  controller.orderPendentes(controller.orderP);
                } else {
                  controller.orderCarrinho(controller.orderC);
                }
              }),
          page == 0
              ? IconButton(
                  icon: Icon(Icons.settings_voice),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => VozDialog(idLista: widget.lista.idLista),
                      barrierDismissible: false,
                    );
                  })
              : Container(),
          IconButton(
              icon: Icon(
                  page == 0 ? Icons.delete_sweep : Icons.remove_shopping_cart),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text(
                            page == 0 ? 'Excluir Todos' : 'Retirar do Carrinho',
                            style: TextStyle(color: Colors.indigo),
                          ),
                          content: Text(page == 0
                              ? 'Deseja excluir todos os itens da lista (obs: os itens do carrinho também serão apagados)?'
                              : 'Deseja Retirar os Itens do carrinho?'),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Cancelar')),
                            FlatButton(
                                onPressed: () {
                                  if (page == 0) {
                                    controller
                                        .apagarTodosItens(widget.lista.idLista);
                                  } else {
                                    controller.removerDoCarrinho();
                                  }
                                  Navigator.pop(context);
                                },
                                child: Text('OK'))
                          ],
                        ));
              })
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (p) {
          setState(() {
            page = p;
          });
        },
        children: <Widget>[
          ListaItensPendentes(lista: widget.lista),
          ListaItensCarrinho(lista: widget.lista)
        ],
      ),
      floatingActionButton: page == 0
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => InserirItem(
                          lista: widget.lista,
                        ));
              },
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconBottomBar(
                icon: Icon(
                  Icons.content_paste,
                  color: page == 0 ? Colors.blue : Colors.black,
                ),
                text: 'Itens Pendentes',
                ck: page == 0 ? true : false,
                voidCallback: () {
                  pageController.animateToPage(0,
                      duration: Duration(milliseconds: 60),
                      curve: Curves.easeInCirc);
                },
              ),
              IconBottomBar(
                icon: Icon(
                  Icons.local_grocery_store,
                  color: page == 1 ? Colors.blue : Colors.black,
                ),
                text: 'Itens no Carrinho',
                ck: page == 1 ? true : false,
                voidCallback: () {
                  pageController.animateToPage(1,
                      duration: Duration(milliseconds: 60),
                      curve: Curves.easeInCirc);
                },
              )
            ],
          )),
    );
  }
}
