import 'package:flutter/material.dart';

class SegundaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Segunda Tela"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Retornar para primeira tela!"),
        ),
      ),
    );
  }
}
