import 'package:flutter/material.dart';
import 'package:projeto_api_backend/models/produto.dart';

class TelaCadastraProduto extends StatelessWidget {
  final nomeController = TextEditingController();
  final quantidadeController = TextEditingController();
  final precoController = TextEditingController();
  final idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastra Novo Produto"),
      ),
      body: Column(
        children: [
          TextField(
            controller: idController,
            decoration: InputDecoration(hintText: "Preencha o ID do Produto:"),
          ),
          TextField(
            controller: nomeController,
            decoration:
                InputDecoration(hintText: "Preencha o Nome do Produto:"),
          ),
          TextField(
            controller: precoController,
            decoration:
                InputDecoration(hintText: "Preencha o Preço do Produto:"),
          ),
          TextField(
            controller: quantidadeController,
            decoration:
                InputDecoration(hintText: "Preencha o Quantidade do Produto:"),
          ),
          TextButton(
            child: Text("Adicionar"),
            onPressed: () {
              Navigator.pop(
                  context,
                  Produtos(
                      int.parse(idController.text),
                      nomeController.text,
                      double.parse(precoController.text),
                      int.parse(quantidadeController.text)));
            },
          ),
        ],
      ),
    );
  }
}
