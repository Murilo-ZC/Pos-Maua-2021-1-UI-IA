import 'package:flutter/material.dart';

import 'terceira_tela.dart';

class SegundaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Segunda Tela"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Retornar para primeira tela!"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TerceiraTela("Veio da segunda!");
                  }));
                },
                child: Text("Abrir Terceira Tela")),
          ],
        ),
      ),
    );
  }
}
