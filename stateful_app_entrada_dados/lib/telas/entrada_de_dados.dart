import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stateful_app_entrada_dados/modelos/usuario.dart';

class TelaEntradaDeDados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gerador de Dados",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:EntradaUsuario(),
    );
  }
}


class EntradaUsuario extends StatefulWidget {
  @override
  _EntradaUsuarioState createState() => _EntradaUsuarioState();
}

class _EntradaUsuarioState extends State<EntradaUsuario> {
  var _NomeTextController = TextEditingController();
  var _EmailTextController = TextEditingController();
  var _TelefoneTextController = TextEditingController();
  var _usuarios = <Usuario>[];

  @override
  Widget build(BuildContext context) {
    return _ControiTelaEntrada();
  }

  Widget _ControiTelaEntrada() {
    return Scaffold(
      appBar: AppBar(title: Text("Entrada De Dados do Usuário"),),
      body: _ControiBodyTelaEntrada(),
      floatingActionButton: _CadastrarUsuario(),
    );
  }

  _CadastrarUsuario(){
    return FloatingActionButton(
      onPressed: (){
        var usuario = Usuario(_NomeTextController.text,
        _EmailTextController.text, _TelefoneTextController.text);
        _usuarios.add(usuario);
        print("Dados lidos: $_usuarios");
        _NomeTextController.clear();
        _EmailTextController.clear();
        _TelefoneTextController.clear();
      },
      child: Icon(Icons.add),
    );
  }
  _ControiBodyTelaEntrada() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemEntradaDados(NomeTextController: _NomeTextController, textoExibicao: "Nome:",),
        ItemEntradaDados(NomeTextController: _EmailTextController, textoExibicao: "E-mail:",),
        ItemEntradaDados(NomeTextController: _TelefoneTextController, textoExibicao: "Telefone:",),
      ],
    );
  }
}

class ItemEntradaDados extends StatelessWidget {
  const ItemEntradaDados({
    Key key,
    @required TextEditingController NomeTextController,
    @required this.textoExibicao
  }) : _NomeTextController = NomeTextController, super(key: key);

  final TextEditingController _NomeTextController;
  final String textoExibicao;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Row(
      children: [
        Text(textoExibicao),
        SizedBox(
          width: 200.0,
          child: TextField(
            controller: _NomeTextController,
          ),
        ),
      ],
    ));
  }
}

