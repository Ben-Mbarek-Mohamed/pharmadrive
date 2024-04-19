import 'dart:convert';

import 'package:dashboard/api/fetchData/get_medicament.dart';
import 'package:dashboard/api/models/medicaments_model.dart';
import 'package:dashboard/widget/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/constants/colors.dart';
import 'package:dashboard/constants/textStyles.dart';
import 'package:dashboard/pages/medicaments/addNewMedicaments.dart';
import 'package:dashboard/widget/menu_side.dart';
import 'package:http/http.dart' as http;

class Medicaments extends StatefulWidget {
  Medicaments({Key key}) : super(key: key);

  @override
  State<Medicaments> createState() => _MedicamentsState();
}

class _MedicamentsState extends State<Medicaments> {
  @override
  Widget build(BuildContext context) {
    GetMedicament fetch = GetMedicament();
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

                  body: Padding(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("Liste des Médicaments ",
                                          style: TextStyle(
                                              color: kGreyTitle,
                                              fontFamily: "Montserrat",
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16)),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Icon(Icons.add, color: kprimaryColor),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (context, animation1,
                                                      animation2) =>
                                                  AddMedicaments(),
                                              transitionDuration: Duration.zero,
                                            ),
                                          );
                                        },
                                        child: Text(" Ajouter un médicament",
                                            style: TextStyle(
                                                color: kprimaryColor,
                                                fontFamily: "Montserrat",
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16))),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      FutureBuilder(
                                          future: fetch.fetchMedicaments(),
                                          builder: (ctx, snapshot) {
                                            List<MedicamentModel> medicaments =
                                                snapshot.data;
                                            return (snapshot.hasData)
                                                ? DataTable(
                                                    columns: [
                                                      DataColumn(
                                                        label: Text(
                                                            "Médicament",
                                                            style:
                                                                medicamentBar),
                                                      ),
                                                      DataColumn(
                                                        label: Text("Image",
                                                            style:
                                                                medicamentBar),
                                                      ),
                                                      DataColumn(
                                                        label: Text("Prix (£)",
                                                            style:
                                                                medicamentBar),
                                                      ),
                                                      DataColumn(
                                                        label: Text("Remise",
                                                            style:
                                                                medicamentBar),
                                                      ),
                                                      DataColumn(
                                                        label: Text("Catégorie",
                                                            style:
                                                                medicamentBar),
                                                      ),
                                                      DataColumn(
                                                        label: Text("Quantité",
                                                            style:
                                                                medicamentBar),
                                                      ),
                                                      DataColumn(
                                                        label: Text("Actions",
                                                            style:
                                                                medicamentBar),
                                                      ),
                                                    ],
                                                    rows: medicaments
                                                        .map(
                                                          (entry) => DataRow(
                                                            cells: <DataCell>[
                                                              DataCell(Text(
                                                                  entry.name,
                                                                  style:
                                                                      medicamentBody)),
                                                              DataCell(SizedBox(
                                                                  width: 40,
                                                                  height: 40,
                                                                  child: Image(
                                                                      image: AssetImage(
                                                                          entry
                                                                              .image)))),
                                                              DataCell(Text(
                                                                  entry.prix,
                                                                  style:
                                                                      medicamentBody)),
                                                              DataCell(Text(
                                                                  entry.remise +
                                                                      "%",
                                                                  style:
                                                                      medicamentBody)),
                                                              DataCell(Text(
                                                                  entry
                                                                      .categorie,
                                                                  style:
                                                                      medicamentBody)),
                                                              DataCell(Text(
                                                                  entry
                                                                      .quantite,
                                                                  style:
                                                                      medicamentBody)),
                                                              DataCell(SizedBox(
                                                                child: Row(
                                                                  children: [
                                                                    IconButton(
                                                                      color:
                                                                          kprimaryColor,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .delete,
                                                                        color: Color(
                                                                            0xFFEC5B5B),
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          http.delete(
                                                                            Uri.parse('http://51.105.246.66:8089/v1/delete/medicament/' +
                                                                                entry.id),
                                                                            headers: <String,
                                                                                String>{
                                                                              'Content-Type': 'application/json; charset=UTF-8',
                                                                            },
                                                                          );
                                                                        });
                                                                      },
                                                                    ),
                                                                    IconButton(
                                                                      color:
                                                                          kprimaryColor,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .edit,
                                                                        color: Color(
                                                                            0xFF000000),
                                                                      ),
                                                                      onPressed:
                                                                          () {},
                                                                    ),
                                                                  ],
                                                                ),
                                                              )),
                                                            ],
                                                          ),
                                                        )
                                                        .toList(),
                                                  )
                                                : Center(
                                                    child:
                                                        CircularProgressIndicator());
                                          }),
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
