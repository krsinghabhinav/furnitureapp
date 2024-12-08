import 'dart:convert';

import 'package:furnitureapp/model/productmodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<ProductModel>?> getProductdata() async {
    String url = "https://5f210aa9daa42f001666535e.mockapi.io/api/products";
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> data = jsonData as List<dynamic>;
        print("Rspose json= $jsonData");
        print("url= $url");
        print("data= $data");

        return data.map((e) => ProductModel.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
