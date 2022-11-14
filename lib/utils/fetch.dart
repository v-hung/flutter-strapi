import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/app.dart';

Future<Map<String, String>> fetch(String path, {method, body}) async {
  var url = Uri.https(HOST, path);
  var response;
  if (method == 'post' || method == 'POST') {
    response = await http.post(url, body: body);
  }
  else {
    response = await http.get(url);
  }

  // if (response.statusCode != 200) {
  //   throw Exception(response.reasonPhrase);
  // }

  return json.decode(response.body);
}