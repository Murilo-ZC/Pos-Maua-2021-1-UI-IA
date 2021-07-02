import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:minha_app_front_e_back/network_helper.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: NossaAplicacao(),
    );
  }
}

class NossaAplicacao extends StatefulWidget {
  @override
  _NossaAplicacaoState createState() => _NossaAplicacaoState();
}

class _NossaAplicacaoState extends State<NossaAplicacao> {
  DropzoneViewController _controller;
  var _hasImage = false;
  final VOID_IMAGE_ASSET_PATH = "assets/void.png";
  var _imageData;

  String _descricao = "Sem Nada Aqui";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jiraya - o Incrivel Ninja!"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                DropzoneView(
                  operation: DragOperation.copy,
                  cursor: CursorType.grab,
                  onCreated: (ctrl) => _controller = ctrl,
                  onLoaded: () => print('Zone loaded'),
                  onError: (ev) => print('Error: $ev'),
                  //onHover: () => print('Zone hovered'),
                  onDrop: (ev) async{
                    _imageData = await _controller.getFileData(ev);
                    setState(() {
                      this._hasImage = true;
                    });
                  },
                  onLeave: () => print('Zone left'),
                ),
                Container(
                  child: ElevatedButton(
                    child: Text("Arraste ou Clique!"),
                    onPressed: () async {
                      var imagemCarregada = await _controller.pickFiles();
                      if (imagemCarregada.isEmpty) return;

                      _imageData = await _controller.getFileData(imagemCarregada[0]);
                      setState(() {
                        _hasImage = true;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: _hasImage ?  Image.memory(_imageData) : Image.asset(VOID_IMAGE_ASSET_PATH),
              ),
              Expanded(child: Text(_descricao),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () async{
                if(!_hasImage) return;
                var retorno = await NetworkHelper.postData("https://teste-back-end-api.cognitiveservices.azure.com/vision/v3.2/detect", <String,String>{"Content-Type":"application/octet-stream", "Ocp-Apim-Subscription-Key": "f95138a2cf694b8aa64d2d119ebdfd06"}, _imageData);
                setState(() {
                  _descricao = "${retorno}";
                });
              }, child: Text("Azure")),
              ElevatedButton(onPressed: ()async{
                if(!_hasImage) return;
                var imageLocation = await _controller.createFileUrl(_imageData);
                var retorno = await NetworkHelper.postData("https://teste-back-end-api.cognitiveservices.azure.com/vision/v3.2/detect", <String,String>{"Content-Type":"multipart/form-data"}, jsonEncode({"file":imageLocation}));
                setState(() {
                  _descricao = "${retorno}";
                });
              }, child: Text("Custom")),
            ],
          ),
        ],
      ),
    );
  }
}
