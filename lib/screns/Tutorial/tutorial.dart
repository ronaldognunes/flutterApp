import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TutorialPage extends StatefulWidget {
  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final imagens = _getTutoriais();
  final CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial'),
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.cyanAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight)),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 20),
          child: ListView(children: [
            CarouselSlider.builder(
              carouselController: controller,
              itemCount: imagens.length,
              itemBuilder: (context, index) {
                final tutorial = imagens[index];
                return Column(
                  children: [
                    Expanded(child: tutorial.imagem),
                    SizedBox(
                      height: 30,
                    ),
                    tutorial.texto,
                  ],
                );
              },
              options: CarouselOptions(
                autoPlay: false,
                height: MediaQuery.of(context).size.height / 1.5,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 2.0,
                initialPage: 0,
                enableInfiniteScroll: false,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton.icon(
                  onPressed: () {
                    controller.previousPage();
                  },
                  icon: Text(
                    '<',
                    style: TextStyle(fontSize: 50),
                  ),
                  label: Text('Anterior'),
                ),
                FlatButton.icon(
                  onPressed: () {
                    controller.nextPage();
                  },
                  icon: Text('Próximo'),
                  label: Text(
                    '>',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ],
            ),
          ]),
        )
      ]),
    );
  }
}

class Tutorial {
  final Image imagem;
  final Text texto;

  Tutorial(this.imagem, this.texto);
}

List<Tutorial> _getTutoriais() {
  var tutoriais = [
    Tutorial(
        Image.asset('lib/assets/Screenshot_20201212-195832.png'),
        Text(
          'Pressionar botão no canto Inferior para inserir uma lista.',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )),
    Tutorial(
        Image.asset('lib/assets/Screenshot_20201212-195857.png'),
        Text(
          'Digitar Nome da Lista e Salvar. Será direcionado para tela de inserir itens da lista.',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )),
    Tutorial(
        Image.asset('lib/assets/Screenshot_20201212-195914.png'),
        Text(
          'Pressionar botão central para adicionar item na lista.',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )),
    Tutorial(
        Image.asset('lib/assets/Screenshot_20201212-195927.png'),
        Text(
          'Informar dados do item e salvar. Item será incluido na lista.',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )),
    Tutorial(
        Image.asset('lib/assets/Screenshot_20201212-195946.png'),
        Text(
          'Pode ser inserido um item na lista por controle de voz, apertando o botão do microfone no menu superior.',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )),
    Tutorial(
        Image.asset('lib/assets/Screenshot_20201212-200019.png'),
        Text(
          'Será aberta uma janela pressione o botão de microfone e fale o nome do item, após captar o aúdio item será gravado na lista.',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )),
    Tutorial(
        Image.asset('lib/assets/Screenshot_20201212-200035.png'),
        Text(
          'Para marcar um item da lista como selecionado basta arrastar o item para o lado direito, item será enviado para o carrinho.',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )),
    Tutorial(
        Image.asset('lib/assets/Screenshot_20201212-200044.png'),
        Text(
          'Para excluir um item da Lista arraste o item para o lado esquerdo, item será excluido da lista.',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )),
    Tutorial(
        Image.asset('lib/assets/Screenshot_20201212-200054.png'),
        Text(
          'Para alterar um item da lista pressione e segure o item por alguns segundos que será aberta uma janela para efetuar as alterações depois só salvar.',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )),
    Tutorial(
        Image.asset('lib/assets/Screenshot_20201212-200122.png'),
        Text(
          'Para visualizar os itens selecionado clicar na aba itens carrinho na parte inferior.',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )),
    Tutorial(
        Image.asset('lib/assets/Screenshot_20201212-200132.png'),
        Text(
          'Para apagar uma lista ou alterar o nome dela. Na tela que mostras as listas cadastradas pressione sobre a lista por alguns segundo que será exibida as opções de alterar e apagar.',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ))
  ];
  return tutoriais;
}
