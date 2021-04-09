import 'package:flutter/material.dart';
import 'package:projeto_api_backend/helper/network_helper.dart';
import 'package:projeto_api_backend/models/produto.dart';
import 'package:projeto_api_backend/screens/tela_cadastra_produto.dart';

class TelaListaProdutos extends StatefulWidget {
  @override
  _TelaListaProdutosState createState() => _TelaListaProdutosState();
}

class _TelaListaProdutosState extends State<TelaListaProdutos> {
  var produto = Produto();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Produtos"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              produto = Produto.fromJson(await NetworkHelper().getProdutos());
              setState(() {});
            },
            child: Text("Aperta!"),
          ),
          Expanded(
            child: produto.produtos.length == 0
                ? Center(
                    child: Text("Lista de Produtos Vazia"),
                  )
                : ListView.builder(
                    itemCount: produto.produtos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(produto.produtos[index].nome),
                          subtitle: Text(
                              "R\$ ${produto.produtos[index].preco} - Quantidade: ${produto.produtos[index].quantidade}"),
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var prod = await Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return TelaCadastraProduto();
            },
          ));
          if (prod != null) {
            var resposta = await NetworkHelper().sendProduto(prod);
            print("$resposta");
            produto.produtos.add(prod);
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
