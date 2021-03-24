import 'package:app_flutter_varias_telas/main.dart';
import 'package:flutter/material.dart';

class TerceiraTela extends StatefulWidget {
  final String textoRecebido;

  const TerceiraTela(this.textoRecebido);
  @override
  _TerceiraTelaState createState() => _TerceiraTelaState();
}

class _TerceiraTelaState extends State<TerceiraTela> {
  var controlador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terceira Tela da Aplicação"),
      ),
      body: Center(
        child: Column(
          children: [
            MeuTexto("Texto para voltar para a tela principal", controlador),
            MeuBotao("Voltar para tela principal com o texto acima", () {}),
            MeuBotao("Apenas voltar para tela principal", () {}),
          ],
        ),
      ),
    );
  }
}
