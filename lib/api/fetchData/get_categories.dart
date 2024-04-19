import 'dart:convert';

import 'package:dashboard/api/models/categories.dart';
import 'package:http/http.dart' as http;

class GetCategories {
  Future<List<CategoriesModel>> fetchCategories() async {
    final response =
        await http.get(Uri.parse("http://51.105.246.66:8089/v1/categories"));

    List<CategoriesModel> catgeories = (json.decode(response.body) as List)
        .map((i) => CategoriesModel.fromJson(i))
        .toList();
    print(catgeories);
    return catgeories;
  }
}
