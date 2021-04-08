import 'package:app_via_cep/models/via_cep.dart';
import 'package:app_via_cep/network_helper.dart';
import 'package:app_via_cep/widgets/card.dart';
import 'package:flutter/material.dart';

class NossaAplicacao extends StatefulWidget {
  @override
  _NossaAplicacaoState createState() => _NossaAplicacaoState();
}

class _NossaAplicacaoState extends State<NossaAplicacao> {
  final controladorTexto = TextEditingController();

  ViaCEP _dados_para_exibicao = ViaCEP();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeiro App com http"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controladorTexto,
            ),
          ),
          TextButton(
            onPressed: () async {
              try {
                var helper = NetworkHelper(
                  url:
                      "https://viacep.com.br/ws/${controladorTexto.text}/json/",
                );
                var resposta = await helper.getData();
                var dadosViaCep = ViaCEP.fromJson(resposta);
                print("Dados recebidos: ${dadosViaCep.logradouro}");
                setState(() {
                  _dados_para_exibicao = dadosViaCep;
                });
              } catch (exception) {
                print("Não foi possível realizar a requisição");
              }
            },
            child: Text("Enviar"),
          ),
          NossoCard(_dados_para_exibicao),
        ],
      ),
    );
  }
}
