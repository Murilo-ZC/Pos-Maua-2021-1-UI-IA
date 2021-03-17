import 'package:flutter/material.dart';

void main() => runApp(MeuAppCartao());

class MeuAppCartao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meu Cartão de Visitas",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: MinhaTelaCartao(),
    );
  }
}

class MinhaTelaCartao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Cartão Pessoal"),
      ),
    );
  }
}



