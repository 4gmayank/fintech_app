import 'dart:convert';

import 'package:fintech_app/data/product_response_model.dart';
import 'package:http/http.dart' as http;

class Configuration {
  static const String globalUrl = "https://fakestoreapi.com/products";
}

class Api {
  Future<List<ProductResponseModel>> fetchProductApis() async {
    var url = Uri.https(
      Configuration.globalUrl,
    );
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    print(await http.read(Uri.https('example.com', 'foobar.txt')));

    // Todo: need to return list of objects from json decode
    List<ProductResponseModel> productList = List.empty(growable: true);
    for (var item in jsonDecode(response.body)) {
      productList.add(item);
    }

    return productList;
  }
}
