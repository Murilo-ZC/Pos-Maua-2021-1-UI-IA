import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var nomeController = TextEditingController();
  var nomeSecretoController = TextEditingController();

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
            ExibeListView(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class ExibeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
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
