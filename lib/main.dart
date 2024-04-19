import 'package:dashboard/pages/LoginRegister/auth.dart';
import 'package:dashboard/pages/commandes.dart';
import 'package:dashboard/pages/country.dart';
import 'package:dashboard/pages/homePage.dart';
import 'package:dashboard/pages/medicaments/addNewMedicaments.dart';
import 'package:dashboard/provider/providerCommandes.dart';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/params_profil.dart';
void main() {
 
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>MyProviderCommands()),
        ],
          child: MyApp(),
      ),
  );
  
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String id = '';
   getData() async {
      SharedPreferences _pref = await SharedPreferences.getInstance();
      setState(() {
        id = _pref.get('id');
      });
      _pref.containsKey("rep");
    }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     getData();
    return MaterialApp(
      title: "tableau de board",
      debugShowCheckedModeBanner: false,
      home: /*(id == null)?Auth() : */HomePage()//AddMedicaments() // ,
      ,routes: {
        'CommadesScreen':(context)=>Commandes(),
    },
    );
  }
}

