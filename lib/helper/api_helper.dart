import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();
  static final apiHelper = ApiHelper._();

  String api = "https://demo-project65687.p.rapidapi.com/catalog/product";
  Map<String, String> headers = {
    'content-type': 'application/json',
    'X-RapidAPI-Key': '2e59e3a545mshd803fd1ed71a23cp1eb9c0jsne0d6a0bc95b6',
    'X-RapidAPI-Host': 'demo-project65687.p.rapidapi.com',
  };
  String data = jsonEncode({
    'name': 'iPhone 15 pro max',
    'price': 150000,
    'manufacturer': 'Apple',
    'category': 'Phone',
    'description': "Rich men's device...",
    'tags': 'rate-5'
  });

  createProduct() async {
    http.Response response = await http.post(
      Uri.parse(api),
      headers: headers,
      body: data,
    );
    if (response.statusCode == 201) {
      log(response.body);
    } else {
      log(response.statusCode.toString());
      log(response.body);
    }
  }

  Future<List> getProducts() async {
    headers = {
      'X-RapidAPI-Key': '2e59e3a545mshd803fd1ed71a23cp1eb9c0jsne0d6a0bc95b6',
      'X-RapidAPI-Host': 'demo-project65687.p.rapidapi.com'
    };
    api = "$api?skip=0&limit=10";
    http.Response response = await http.get(Uri.parse(api), headers: headers);
    List allPro = [];

    log("CODE=${response.statusCode}");

    if (response.statusCode == 200) {
      Map res = jsonDecode(response.body);
      allPro = res['products'];
      log("DATA: $allPro");
    }
    return allPro;
  }
}
