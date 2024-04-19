import 'dart:convert';
import 'dart:html';
import 'dart:math';
import 'dart:typed_data';
import 'package:dashboard/Models/commande.dart';
import 'package:dashboard/provider/providercategory.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProviderCommands extends ChangeNotifier {
  List<Commande> commads = [] ;
  List<Commande> allCommads = [];
  void setCommandes(List<Commande> commandes){
    this.commads = commandes;
    notifyListeners();
  }
  void setAllCommandes(List<Commande> commandes){
    this.allCommads = commandes;
    notifyListeners();
  }
  // var image;
  // var medicament;
  // var prix;
  // var remise;
  // var quantite;
  // var pharmacie;
  // var categorie;
  //
  // Future setImage(img) async {
  //   this.image = img;
  //   this.notifyListeners();
  // }
  //
  // Future setName(
  //     medicament, prix, remise, quantite, pharmacie, categorie) async {
  //   this.medicament = medicament;
  //   this.prix = prix;
  //   this.remise = remise;
  //   this.quantite = quantite;
  //   this.pharmacie = pharmacie;
  //   this.categorie = categorie;
  //   this.notifyListeners();
  // }
  //
  // Future makePostRequest() async {
  //   String url = 'http://51.105.246.66:8089/v1/add/medicament';
  //   Map<String, String> headers = {"content-type": "multipart/form-data"};
  //   var request = http.MultipartRequest('POST', Uri.parse(url));
  //   request.headers.addAll(headers);
  //   Uint8List data = await this.image.readAsBytes();
  //   List<int> list = data.cast();
  //   //request.files.add(http.MultipartFile.fromBytes('file', list,
  //   //  filename: Random().nextInt(100).toString() + "file.png"));
  //   request.fields["medicament"] = medicament;
  //   request.fields["prix"] = prix;
  //   request.fields["remise"] = remise;
  //   request.fields["quantite"] = quantite;
  //   request.fields["pharmacie"] = pharmacie;
  //   request.fields["categorie"] = categorie;
  //
  //   // Now we can make this call
  //
  //   var response = await request.send();
  //   //We've made a post request...
  //   //Let's read response now
  //
  //   response.stream.bytesToString().asStream().listen((event) {
  //     var parsedJson = json.decode(event);
  //     print(parsedJson);
  //     print(response.statusCode);
  //     //It's done...
  //   });
  // }
}
setCommandes(BuildContext context,List<Commande> commande){
  Provider.of<MyProviderCommands>(context,listen: false).setCommandes(commande);
}

List<Commande> getCommandes(BuildContext context){
  return Provider.of<MyProviderCommands>(context,listen: false).commads;
}
setAllCommandes(BuildContext context,List<Commande> commande){
  Provider.of<MyProviderCommands>(context,listen: false).setAllCommandes(commande);
}

List<Commande> getAllCommandes(BuildContext context){
  return Provider.of<MyProviderCommands>(context,listen: false).allCommads;
}
