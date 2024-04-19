import 'package:dashboard/api/fetchData/getPharmacien.dart';
import 'package:dashboard/constants/colors.dart';
import 'package:dashboard/constants/textStyles.dart';
import 'package:dashboard/pages/medicaments/medicaments.dart';
import 'package:dashboard/provider/providerCommandes.dart';
import 'package:dashboard/widget/customAppBar.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:dashboard/widget/forms/uploadImage.dart';
import 'package:dashboard/widget/menu_side.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddMedicaments extends StatefulWidget {
  AddMedicaments({Key key}) : super(key: key);

  @override
  State<AddMedicaments> createState() => _AddMedicamentsState();
}

class _AddMedicamentsState extends State<AddMedicaments> {
  final list = ["Sante", "Sport", "Maquillage"];
  List<DropdownMenuItem<String>> _createList() {
    return list
        .map<DropdownMenuItem<String>>(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final medicament = TextEditingController();
    final prix = TextEditingController();
    final remise = TextEditingController();
    final quantite = TextEditingController();
    final pharmacie = TextEditingController();
    final categorie = TextEditingController();
    String _selectedItem1 = "Sante";
    String name = "";
    String idPharmac = "";
    SingleValueDropDownController _cnt;
    @override
    void dispose() {
      _cnt.dispose();

      super.dispose();
    }

    fetchDataUser getUser = fetchDataUser();

    getPharmacien() async {
      String nom = await getUser.getuser().then((value) => value.representant);
      setState(() {
        name = nom;
      });
    }

    @override
    void initState() {
      super.initState();
      getPharmacien();
      _cnt = SingleValueDropDownController();
    }

    Future<http.Response> addMedicament(
        String medicament, prix, remise, quantite, categorie) async {
      SharedPreferences _pref = await SharedPreferences.getInstance();
      return http.post(
        Uri.parse('http://51.105.246.66:8089/v1/addMedicament'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'nomMedicament': medicament.isEmpty ? "non défini" : medicament,
          "prix": prix.isEmpty ? "non défini" : prix,
          "remise": remise.isEmpty ? "non défini" : remise,
          "quantite": quantite.isEmpty ? "non défini" : quantite,
          "idPharmacie": _pref.getString("id"),
          "idCategorie": categorie.isEmpty ? "non défini" : categorie,
        }),
      );
    }

    String categorieValueField = "";

    return Container(
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 5,
              child: MenuSide(),
            ),
            Expanded(
              flex: 20,
              child: Scaffold(
                  backgroundColor: Colors.black12,
                  appBar: CustomAppBar("Médicaments"),
                  ///// body will change with widgets dynamiclly

                  body: ChangeNotifierProvider<MyProviderCommands>(
                      create: (context) => MyProviderCommands(),
                      child: Consumer<MyProviderCommands>(
                          builder: (context, provider, child) {
                        return Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, top: 15.0, right: 15.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 15),
                                        child: Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    PageRouteBuilder(
                                                      pageBuilder: (context,
                                                              animation1,
                                                              animation2) =>
                                                          Medicaments(),
                                                      transitionDuration:
                                                          Duration.zero,
                                                    ));
                                              },
                                              child: Text(
                                                  "Liste des médicaments",
                                                  style: TextStyle(
                                                      color: kprimaryColor,
                                                      fontFamily: "Montserrat",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16)),
                                            ),
                                            SizedBox(
                                              width: 25,
                                            ),
                                            Icon(Icons.add,
                                                color: kprimaryColor),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            TextButton(
                                                onPressed: () {},
                                                child: Text(
                                                    "Ajouter un médicament",
                                                    style: TextStyle(
                                                        color: kGreyTitle,
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16))),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, left: 8, right: 8),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 10,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 50,
                                                          width: 150,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              "Name",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Montserrat",
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 16),
                                                            ),
                                                          ),
                                                        ),
                                                        LayoutBuilder(
                                                          builder: (BuildContext
                                                                  context,
                                                              BoxConstraints
                                                                  constraints) {
                                                            return Column(
                                                              children: <
                                                                  Widget>[
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          3.7,
                                                                      color: Colors
                                                                          .white,
                                                                      child: TextField(
                                                                          style: kNomralTextStyle,
                                                                          decoration: InputDecoration(
                                                                            contentPadding:
                                                                                EdgeInsets.all(8.0),
                                                                            border:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF21ba19),
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF21ba19),
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            hintText:
                                                                                "nom du medicament",
                                                                            fillColor:
                                                                                Color(0xFF21ba19),
                                                                          ),
                                                                          controller: medicament),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 50,
                                                          width: 150,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              "Image",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Montserrat",
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 16),
                                                            ),
                                                          ),
                                                        ),
                                                        UploadImage(),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 50,
                                                          width: 150,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              "Prix",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Montserrat",
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 16),
                                                            ),
                                                          ),
                                                        ),
                                                        /////////////////////
                                                        LayoutBuilder(
                                                          builder: (BuildContext
                                                                  context,
                                                              BoxConstraints
                                                                  constraints) {
                                                            return Column(
                                                              children: <
                                                                  Widget>[
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          3.7,
                                                                      color: Colors
                                                                          .white,
                                                                      child: TextField(
                                                                          style: kNomralTextStyle,
                                                                          decoration: InputDecoration(
                                                                            contentPadding:
                                                                                EdgeInsets.all(8.0),
                                                                            border:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF21ba19),
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF21ba19),
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            hintText:
                                                                                "Prix",
                                                                            fillColor:
                                                                                Color(0xFF21ba19),
                                                                          ),
                                                                          controller: prix),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 50,
                                                          width: 150,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              "Remise",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Montserrat",
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 16),
                                                            ),
                                                          ),
                                                        ),
                                                        LayoutBuilder(
                                                          builder: (BuildContext
                                                                  context,
                                                              BoxConstraints
                                                                  constraints) {
                                                            return Column(
                                                              children: <
                                                                  Widget>[
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          3.7,
                                                                      color: Colors
                                                                          .white,
                                                                      child: TextField(
                                                                          style: kNomralTextStyle,
                                                                          decoration: InputDecoration(
                                                                            contentPadding:
                                                                                EdgeInsets.all(8.0),
                                                                            border:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF21ba19),
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF21ba19),
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            hintText:
                                                                                "Remise en %",
                                                                            fillColor:
                                                                                Color(0xFF21ba19),
                                                                          ),
                                                                          controller: remise),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 10,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        LayoutBuilder(
                                                          builder: (BuildContext
                                                                  context,
                                                              BoxConstraints
                                                                  constraints) {
                                                            return Column(
                                                              children: <
                                                                  Widget>[
                                                                Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          50,
                                                                      width:
                                                                          150,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(left: 8.0),
                                                                        child: Text(
                                                                            "Description",
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: "Montserrat",
                                                                              fontStyle: FontStyle.normal,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 16,
                                                                            )),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          3.7,
                                                                      color: Colors
                                                                          .white,
                                                                      child:
                                                                          TextField(
                                                                        style:
                                                                            kNomralTextStyle,
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        decoration: InputDecoration(
                                                                            border: OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF21ba19),
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            // hintText: "Description",
                                                                            contentPadding: EdgeInsets.only(top: 137, bottom: 90),
                                                                            enabledBorder: OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF21ba19),
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            fillColor: Color(0xFF21ba19),
                                                                            hintStyle: TextStyle(
                                                                              fontFamily: "Montserrat",
                                                                              fontStyle: FontStyle.normal,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 12,
                                                                            )),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 50,
                                                          width: 150,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              "Quantité",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Montserrat",
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 16),
                                                            ),
                                                          ),
                                                        ),
                                                        LayoutBuilder(
                                                          builder: (BuildContext
                                                                  context,
                                                              BoxConstraints
                                                                  constraints) {
                                                            return Column(
                                                              children: <
                                                                  Widget>[
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          3.7,
                                                                      color: Colors
                                                                          .white,
                                                                      child: TextField(
                                                                          style: kNomralTextStyle,
                                                                          decoration: InputDecoration(
                                                                            contentPadding:
                                                                                EdgeInsets.all(8.0),
                                                                            border:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF21ba19),
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0xFF21ba19),
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            hintText:
                                                                                "Quantité",
                                                                            fillColor:
                                                                                Color(0xFF21ba19),
                                                                          ),
                                                                          controller: quantite),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        LayoutBuilder(
                                                          builder: (BuildContext
                                                                  context,
                                                              BoxConstraints
                                                                  constraints) {
                                                            return Column(
                                                              children: <
                                                                  Widget>[
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [],
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 50,
                                                          width: 150,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Text(
                                                              "Catégorie",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Montserrat",
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 16),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: Color(
                                                                      0xFF21ba19),
                                                                  width: 1.0,
                                                                  style:
                                                                      BorderStyle
                                                                          .solid),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                            height: 45,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                3.75,
                                                            child:
                                                                DropdownButton(
                                                              items:
                                                                  _createList(),
                                                              hint: Text(
                                                                  "$_selectedItem1"),
                                                              onChanged: (String
                                                                      value) =>
                                                                  setState(() {
                                                                _selectedItem1 =
                                                                    value;
                                                                categorie.text =
                                                                    value;
                                                              }),
                                                            )
                                                            /* PopupMenuButton(
                                                              icon: const Icon(Icons
                                                                  .arrow_drop_down),
                                                              itemBuilder:
                                                                  (BuildContext
                                                                      context) {
                                                                return items.map<
                                                                    PopupMenuItem<
                                                                        String>>((String
                                                                    value) {
                                                                  return new PopupMenuItem(
                                                                      child: new Text(
                                                                          value),
                                                                      value:
                                                                          value);
                                                                }).toList();
                                                              },
                                                              initialValue:
                                                                  _selected,
                                                              onSelected:
                                                                  (value) {
                                                                categorie.text =
                                                                    value;
                                                                setState(() {
                                                                  _selected =
                                                                      value;
                                                                  print(value);
                                                                });
                                                              },
                                                            )*/
                                                            ,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                      SizedBox(height: 20),
                                      Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                print(categorie.text);
                                                addMedicament(
                                                    medicament.text,
                                                    prix.text,
                                                    remise.text,
                                                    quantite.text,
                                                    categorie.text);
                                                showDialog<String>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                    title: const Text(
                                                        'Pharmadrive'),
                                                    content: Text(
                                                        'Medicament à été ajouté '),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context,
                                                                'Cancel'),
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context, 'OK'),
                                                        child: const Text('OK'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 55,
                                                        vertical: 8),
                                                child: Text("Enregistrer",
                                                    style: kButtonStyle),
                                              ),
                                              style: TextButton.styleFrom(
                                                  primary: Colors.white,
                                                  backgroundColor:
                                                      kprimaryColor),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {},
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25,
                                                        vertical: 8),
                                                child: Text("Cancel",
                                                    style: kButtonStyle),
                                              ),
                                              style: TextButton.styleFrom(
                                                  primary: Colors.black,
                                                  backgroundColor:
                                                      Color(0xFFe4e4e4)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 40),
                                    ],
                                  ),
                                )));
                      }))),
            )
          ],
        ),
      ),
    );
  }
}
