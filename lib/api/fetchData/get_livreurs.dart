import 'dart:convert';

import 'package:dashboard/api/models/livreurs_model.dart';
import 'package:http/http.dart' as http;
import '../models/livreurs_model.dart';

class GetLivreurs {
  Future<List<LivreursModel>> fetchLivreurs() async {
    final response =
        await http.get(Uri.parse("http://51.105.246.66:8089/v1/livreurs"));

    List<LivreursModel> livreurs = (json.decode(response.body) as List)
        .map((i) => LivreursModel.fromJson(i))
        .toList();
    print(livreurs);
    return livreurs;
  }
}
