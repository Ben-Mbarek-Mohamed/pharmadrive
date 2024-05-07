import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/livreur.dart';

class MyLivreurProvider extends ChangeNotifier {
  List<Livreur> allLivreurs = [];
  List<Livreur> livreurs = [];

  void setLivreurs(List<Livreur> val){
    this.livreurs = val;
    notifyListeners();
  }

  void setAllLivreurs(List<Livreur> val){
    this.allLivreurs = val;
    notifyListeners();
  }
}


setLivreurs(BuildContext context, List<Livreur> val){
  Provider.of<MyLivreurProvider>(context, listen: false).setLivreurs(val);
}
List<Livreur> getLivreurs(BuildContext context){
  return Provider.of<MyLivreurProvider>(context,listen: false).livreurs;
}

setAllLivreurs(BuildContext context, List<Livreur> val){
  Provider.of<MyLivreurProvider>(context, listen: false).setAllLivreurs(val);
}
List<Livreur> getAllLivreurs(BuildContext context){
  return Provider.of<MyLivreurProvider>(context,listen: false).allLivreurs;
}