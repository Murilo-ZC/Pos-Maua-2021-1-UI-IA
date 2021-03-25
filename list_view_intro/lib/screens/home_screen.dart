import 'package:flutter/material.dart';
import 'package:list_view_intro/models/heroi.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var nomeController = TextEditingController();
  var nomeSecretoController = TextEditingController();
  final _listaDeHerois = <Heroi>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Herois"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            EntradaDeDados(nomeController, "Nome de Herói - Batman"),
            EntradaDeDados(nomeSecretoController, "Nome do Alter Ego - Bruce"),
            ExibeListView(_listaDeHerois),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _listaDeHerois.add(
            Heroi(nomeController.text, nomeSecretoController.text),
          );
          print(_listaDeHerois);
        },
      ),
    );
  }
}

class ExibeListView extends StatelessWidget {
  final listaParaExibir;

  const ExibeListView(this.listaParaExibir);

  @override
  Widget build(BuildContext context) {
    return listaParaExibir.isEmpty
        ? Text("Nada para exibir")
        : ListView.builder(
            itemCount: listaParaExibir.length,
            itemBuilder: (context, index) {
              return Text("${listaParaExibir[index]}");
            },
          );
  }
}

class EntradaDeDados extends StatelessWidget {
  final TextEditingController _controlador;
  final String _textoHint;

  const EntradaDeDados(this._controlador, this._textoHint);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          controller: _controlador,
          decoration: InputDecoration(hintText: _textoHint),
        ),
      ),
    );
  }
}
