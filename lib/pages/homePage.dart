import 'dart:convert';
import 'package:dashboard/Models/commande.dart';
import 'package:dashboard/Models/pharmacie.dart';

import 'package:dashboard/Models/pharmacie.dart';
import 'package:dashboard/pages/commandes.dart';
import 'package:dashboard/widget/clientsDetails.dart';
import 'package:dashboard/widget/commadDetails.dart';
import 'package:dashboard/widget/customAppBar.dart';
import 'package:dashboard/widget/menu_side.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/client.dart';
import '../Models/commandsExample.dart';
import '../constants/style.dart';
import 'homeComponents/clientsWidget.dart';
import 'homeComponents/commandsWidget.dart';
import 'homeComponents/livreursWidget.dart';
import 'homeComponents/pharmaciesWidget.dart';
import 'homeComponents/trasformationsWidget.dart';
import 'homeComponents/ventesWidget.dart';
import 'homeComponents/visitesWidget.dart';
import 'overview/widgets/bar_chart.dart';
import 'overview/widgets/info_card.dart';
import 'overview/widgets/revenue_section_large.dart';

class Details {
  int pNum = 0;
  int lNum = 0;
  int cNum = 0;
  int clientNum = 0;
  List<Pharmacie> allpharmacies = [];
  List<Commande> allcommands = [];
  List<Client> allCclients = [];
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _viewTypeIsList = false;
  Details d = new Details();

  getDetails() async {
    String url1 = "http://localhost:8089/v1/pharmacies";
    String url2 = "http://localhost:8089/v1/livreurs";
    String url3 = "http://localhost:8089/v1/allcommandes";
    String url4 = "http://localhost:8089/v1/getAllClients";
    var responce = await http.get(
      Uri.parse(url1),
      headers: {'Content-Type': 'application/json'},
    );
    print(responce.statusCode);
    if (responce.statusCode == 200) {
      List allPharmacies = jsonDecode(responce.body);
      if (mounted) {
        List<Pharmacie> allPharm =
            allPharmacies.map((e) => Pharmacie.fromJson(e)).toList();
        setState(() {
          d.pNum = allPharmacies.length;
          d.allpharmacies = allPharm;
        });
      }
    }
    var responce2 = await http.get(
      Uri.parse(url2),
      headers: {'Content-Type': 'application/json'},
    );
    if (responce2.statusCode == 200) {
      List allLivreurs = jsonDecode(responce2.body);
      if (mounted) {
        setState(() {
          d.lNum = allLivreurs.length;
        });
      }
    }
    var responce3 = await http.get(
      Uri.parse(url3),
      headers: {'Content-Type': 'application/json'},
    );
    if (responce3.statusCode == 200) {
      List allCommandes = jsonDecode(responce3.body);
      if (mounted) {
        List<Commande> commands =
            allCommandes.map((e) => Commande.fromJson(e)).toList();
        setState(() {
          d.cNum = allCommandes.length;
          d.allcommands = commands;
        });
      }
    }
    var responce4 = await http.get(
      Uri.parse(url4),
      headers: {'Content-Type': 'application/json'},
    );
    if (responce4.statusCode == 200) {
      List clients = jsonDecode(responce4.body);
      if (mounted) {
        List<Client> c = clients.map((e) => Client.fromJson(e)).toList();
        setState(() {
          d.clientNum = c.length;
          d.allCclients = c;
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        body: Row(
          children: [
            (size.width > 1428)
                ? Container(width: size.width * 0.2, child: MenuSide())
                : SizedBox(),
            (_viewTypeIsList || size.width < 1140)
                ? buildHomeBodyList(size.width, () {
                    setState(() {
                      _viewTypeIsList = false;
                    });
                  }, () {
                    setState(() {
                      _viewTypeIsList = true;
                    });
                  }, d, context)
                : buildHomeBodyGreed(size.width, () {
                    setState(() {
                      _viewTypeIsList = false;
                    });
                  }, () {
                    setState(() {
                      _viewTypeIsList = true;
                    });
                  }, d, context),
          ],
        ),
      ),
    );
  }
}

Widget buildHomeBodyList(
    double widh, action1, action2, Details details, context) {
  return Container(
    width: (widh > 1428) ? widh * 0.8 : widh,
    child: Scaffold(
      drawer: (widh < 1428)
          ? Drawer(
              child: MenuSide(),
            )
          : SizedBox(),
      backgroundColor: Colors.black12,
      appBar: CustomAppBar("Tableau de board"),
      ///// body will change with widgets dynamiclly

      body: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: action2,
                          child: Icon(
                            Icons.list,
                            color: Colors.green,
                            size: 30,
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                          onTap: action1,
                          child: Icon(
                            Icons.list_alt,
                            color: Colors.green,
                            size: 30,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: widh * 0.2, right: widh * 0.2,bottom: 20),
                    child: PharmaciesWidget(context,details),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: widh * 0.2, right: widh * 0.2,bottom: 20),
                    child: CommandesWidget(context, details),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: widh * 0.2, right: widh * 0.2,bottom: 20),
                    child: VentesWidget(context, details),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: widh * 0.2, right: widh * 0.2,bottom: 20),
                    child: ClientsWidget(context, details),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: widh * 0.2, right: widh * 0.2,bottom: 20),
                    child: LivreursWidget(context, details),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: widh * 0.2, right: widh * 0.2,bottom: 20),
                    child: TransWidget(context, details),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(left: widh * 0.2, right: widh * 0.2,bottom: 20),
                    child: VisistesWidget(context, details),
                  ),
                  SimpleBarChart(),
                ],
              ),
            ),
          )),
    ),
  );
}

Widget buildHomeBodyGreed(
    double width, action1, action2, Details details, context) {
  return Container(
    width: (width > 1428) ? width * 0.8 : width,
    child: Scaffold(
      drawer: (width < 1428)
          ? Drawer(
              child: MenuSide(),
            )
          : SizedBox(),
      backgroundColor: Colors.black12,
      appBar: CustomAppBar("Tableau de board"),
      ///// body will change with widgets dynamiclly

      body: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: action2,
                          child: Icon(
                            Icons.list,
                            color: Colors.green,
                            size: 30,
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                          onTap: action1,
                          child: Icon(
                            Icons.list_alt,
                            color: Colors.green,
                            size: 30,
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 60,),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            PharmaciesWidget(context,details),
                            SizedBox(
                              width: width / 64,
                            ),
                            CommandesWidget(context,details),
                            SizedBox(
                              width: width / 64,
                            ),
                            VentesWidget(context,details),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            ClientsWidget(context,details),
                            SizedBox(
                              width: width / 64,
                            ),
                            LivreursWidget(context, details),
                            SizedBox(
                              width: width / 64,
                            ),
                            TransWidget(context,  details),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Row(
                            children: [
                              VisistesWidget(context, details),
                              SizedBox(
                                width: width / 64,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SimpleBarChart(),
                ],
              ),
            ),
          )),
    ),
  );
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}