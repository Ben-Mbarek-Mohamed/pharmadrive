import 'dart:convert';
import 'dart:html';
import 'dart:math';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  var image;
  var name;
  Future setImage(img) async {
    this.image = img;
    this.notifyListeners();
  }

  Future setName(String name) async {
    this.name = name;
    this.notifyListeners();
  }

  upImage() async {
    var postUri = Uri.parse("http://51.105.246.66:8089/v1/add/categorie");

    var request = new http.MultipartRequest("POST", postUri);
    request.files.add(new http.MultipartFile('image', image, image.size,
        filename: image.name));

    //-------Send request
    await request.send().then((value) async {
      //------Read response
      String result = await value.stream.bytesToString();

      //-------Your response
      print(result);
    });
  }

  uploadFile() async {
    var postUri = Uri.parse("http://51.105.246.66:8089/v1/add/categorie");
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['user'] = 'blah';
    request.files.add(new http.MultipartFile.fromBytes(
        'file', await image.fromUri(Uri.parse(this.image)).readAsBytes()));

    request.send().then((response) {
      if (response.statusCode == 200) print("Uploaded!");
    });
  }

  Future makePostRequest() async {
    String url = 'http://51.105.246.66:8089/v1/add/categorie';
    Map<String, String> headers = {"content-type": "multipart/form-data"};
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    Uint8List data = await this.image.readAsBytes();
    List<int> list = data.cast();
    request.files.add(http.MultipartFile.fromBytes('file', list,
        filename: Random().nextInt(1000).toString() + "file.png"));
    request.fields["name"] = name;

    // Now we can make this call

    var response = await request.send();
    //We've made a post request...
    //Let's read response now

    response.stream.bytesToString().asStream().listen((event) {
      var parsedJson = json.decode(event);
      print(parsedJson);
      print(response.statusCode);
      //It's done...
    });
  }
}
