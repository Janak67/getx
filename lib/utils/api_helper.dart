import 'dart:convert';

import 'package:getx/screen/home/model/home_model.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  static APIHelper apiHelper = APIHelper._();

  APIHelper._();

  Future<List<HomeModel>?> productApiCall() async {
    String apiLink = "https://fakestoreapi.com/products";
    var response = await http.get(Uri.parse(apiLink));
    if (response.statusCode == 200) {
      List json = jsonDecode(response.body);
      List<HomeModel> productList =
          json.map((e) => HomeModel.mapToModel(e)).toList();
      return productList;
    }
    return null;
  }
}
