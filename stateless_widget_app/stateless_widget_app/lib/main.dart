import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stateless_widget_app/constantes.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(CaminhoImagens["IMAGEM_PESSOAL"]),
          Text("Murilo Zanini de Carvalho", style: TextStyle(fontSize: 24.0),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(CaminhoImagens["LOGO_GITHUB"]),
              Image.asset(CaminhoImagens["QRCODE_GITHUB"]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(CaminhoImagens["LOGO_LINKEDIN"]),
              Image.asset(CaminhoImagens["QRCODE_LINKEDIN"]),
            ],
          ),
        ],
      ),
    );
  }
}



