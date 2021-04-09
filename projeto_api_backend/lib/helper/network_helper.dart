import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_api_backend/models/produto.dart';

class NetworkHelper {
  final String url;
  NetworkHelper({this.url});

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //Resultado da requisição
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      return null;
    }
  }

  Future getProdutos() async {
    var headers = {'Authorization': 'Bearer banan@'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api.sheety.co/6ae812e756dedab7b3bff4041c794c8b/pseudoBackend/produtos'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //https://stackoverflow.com/questions/55520829/how-to-get-response-body-with-request-send-in-dart
      var resposta = await http.Response.fromStream(response);
      return jsonDecode(resposta.body);
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }

  Future sendProduto(Produtos produtos) async {
    var headers = {
      'Authorization': 'Bearer banan@',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://api.sheety.co/6ae812e756dedab7b3bff4041c794c8b/pseudoBackend/produtos'));
    request.body = jsonEncode({"produto": produtos.toJson()});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resposta = await http.Response.fromStream(response);
      return jsonDecode(resposta.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
