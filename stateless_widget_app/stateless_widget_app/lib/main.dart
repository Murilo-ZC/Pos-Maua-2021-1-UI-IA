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
      body: Container(
        color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.asset(CaminhoImagens["IMAGEM_PESSOAL"]),
              CircleAvatar(
                backgroundImage: AssetImage(CaminhoImagens["IMAGEM_PESSOAL"]),
                radius: 100.0,

              ),
              Text("Murilo Zanini de Carvalho", style: TextStyle(fontSize: 24.0),),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset(CaminhoImagens["LOGO_GITHUB"]),
                    CircleAvatar(
                      backgroundImage: AssetImage(CaminhoImagens["LOGO_GITHUB"]),
                      radius: 80.0,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 24.0,),
                    Image.asset(CaminhoImagens["QRCODE_GITHUB"]),


                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset(CaminhoImagens["LOGO_LINKEDIN"]),
                    CircleAvatar(
                      backgroundImage: AssetImage(CaminhoImagens["LOGO_LINKEDIN"]),
                      radius: 80.0,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 24.0,),
                    //Image.asset(CaminhoImagens["QRCODE_LINKEDIN"]),
                    CircleAvatar(
                      backgroundImage: AssetImage(CaminhoImagens["QRCODE_LINKEDIN"]),
                      radius: 120.0,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



