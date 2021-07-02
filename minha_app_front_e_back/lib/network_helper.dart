import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  static Future getData(final String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //Resultado da requisição
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      return null;
    }
  }

  static Future postData(String url, Map header, var body) async {
    http.Response response = await http.post(Uri.parse(url),
        headers: header, body: body);
    if (response.statusCode == 200) {
      //Resultado da requisição
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      print(response.body);
      return null;
    }
  }
}