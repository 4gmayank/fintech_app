import 'dart:convert';

import 'package:fintech_app/data/product_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Configuration {
  static const String globalUrl = "https://fakestoreapi.com/products";
}

class Api {
  Future<List<ProductResponseModel>> fetchProductApis() async {
    final response = await Dio().get(Configuration.globalUrl);

    debugPrint(response.data.toString());

    try {
      final List<dynamic> decodedList =
          jsonDecode(response.data) as List<dynamic>;
      List<ProductResponseModel> productList = decodedList
          .map((item) =>
              ProductResponseModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return productList;
    } catch (e, s) {
      print(s);
    }
    return [];
  }

  Future<List<ProductResponseModel>> fetchProductApisHttp() async {
    String run = "";
    var url = Uri(
      host: Configuration.globalUrl,
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
