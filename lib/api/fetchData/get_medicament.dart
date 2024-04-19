import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/medicaments_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetMedicament {
  //get id pharmacy from local storage browser

  Future<List<MedicamentModel>> fetchMedicaments() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
     print(_pref.getString("id"));
    final response = await http.get(Uri.parse(
        "http://51.105.246.66:8089/v1/medicaments/pharmacy/" +
            _pref.getString("id")));
    print(json.decode(response.body) as List);
    List<MedicamentModel> medicaments = (json.decode(response.body) as List)
        .map((i) => MedicamentModel.fromJson(i))
        .toList();
    print(medicaments);
    return medicaments;
  }
}
