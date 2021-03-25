import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final _heroi;
  DetailScreen(this._heroi);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Heroi"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 10,
              child: Image.network(
                  "https://keyword-hero.com/wp-content/uploads/2017/04/Cart-Hero.png")),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _heroi.nome,
              style: TextStyle(fontSize: 24),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_heroi.alterEgo),
          )),
        ],
      ),
    );
  }
}
