import 'dart:async';
import 'dart:convert';

import 'package:dashboard/api/models/pharmacien.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class fetchDataUser {
  Future<ProfileModel> getuser() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    if(_pref.get('id') != null){
      final response = await http.post(Uri.parse(
          'http://localhost:8089/v1/pharmacie/' +
              _pref.get('id')));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return ProfileModel.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    }

  }
}
