import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import 'network_helper.dart';
import 'network_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _hasImage = false;
  final DEFAULT_IMAGE_PATH = "assets/void.png";
  Uint8List _dadosImagem;
  DropzoneViewController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ola Mundo POC"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: Colors.blueGrey,
              child: Stack(
                children: [
                  buildZone(context),
                  Center(
                    child: ElevatedButton(
                      child: Text("Arraste os arquivos aqui ou Clique Aqui!!"),
                      onPressed: () async{
                        final event = await _controller.pickFiles();
                        //Verifica se nenhum arquivo foi selecionado
                        if(event.isEmpty) return;
                        //Colocando os dados da imagem no arquivo
                        _dadosImagem = await this._controller.getFileData(event.first);
                        // print("${_dadosImagem}");
                        setState(()  {
                          _hasImage = true;
                        });

                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _hasImage ? Image.memory(_dadosImagem) : Image.asset(DEFAULT_IMAGE_PATH),
              ),
              Expanded(child: Text("Descrição"))
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () async{
                  //Realiza o envio dos dados para o Azure
                  var dados_resposta = await NetworkHelper.postData("https://teste-back-end-api.cognitiveservices.azure.com//vision/v3.2/detect", <String,String>{"Content-Type": "application/octet-stream",
                    "Ocp-Apim-Subscription-Key":"SUA-CHAVE-AQUI"}, _dadosImagem);
                  print(dados_resposta);
                }, child: Text("Azure"),),
                ElevatedButton(onPressed: (){}, child: Text("Custom"),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildZone(BuildContext context) {
    return Builder(builder: (context) {
      return DropzoneView(
        operation: DragOperation.copy,
        cursor: CursorType.grab,
        onCreated: (ctrl) => this._controller = ctrl,
        onLoaded: () => print('Zone 1 loaded'),
        onError: (ev) => print('Zone 1 error: $ev'),
        onHover: () {
          //Fica sendo chamado enquanto estiver com o mouse por cima
          print('Zone 1 hovered');
        },
        onLeave: () {
          //Roda quando deixa a zona, ainda carregando o arquivo
          print('Zone 1 left');
        },
        onDrop: (ev)  async {
          print('Zone 1 drop: ${ev.name}');
          //Colocando os dados da imagem no arquivo
          _dadosImagem = await this._controller.getFileData(ev);
          setState(()  {
            _hasImage = true;
          });

        },
      );
    });
  }
}


