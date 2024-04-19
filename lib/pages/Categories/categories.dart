import 'dart:html';

import 'package:dashboard/api/fetchData/get_categories.dart';
import 'package:dashboard/api/models/categories.dart';
import 'package:dashboard/constants/colors.dart';
import 'package:dashboard/constants/textStyles.dart';
import 'package:dashboard/pages/livraisons_details_person.dart';
import 'package:dashboard/widget/customAppBar.dart';
import 'package:dashboard/widget/menu_side.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'addNewCategory.dart';
import 'package:cached_network_image/cached_network_image.dart';

main() {
  print("hekko");
}

class Categories extends StatefulWidget {
  Categories({Key key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Map<String, String> m = {
    'Santé': 'assets/icons/sante.png',
    'Manan et bébé': 'assets/icons/maman.png',
    'Hygiène': 'assets/icons/hygiene.png',
    'Beauté': 'assets/icons/beaute.png',
    'Maquillage & parfumerie': 'assets/icons/maquillage.png',
    'Nutrition & bien etre': 'assets/icons/nut.png',
    'Soins cheveaux': 'assets/icons/chev.png',
    'Bio & naturel': 'assets/icons/bio.png',
    'vétérinaire': 'assets/icons/vet.png',
    'Homme': 'assets/icons/homme.png',
    'Sport': 'assets/icons/sport.png',
  };

  @override
  Widget build(BuildContext context) {
    GetCategories fetch = GetCategories();
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
                  appBar: CustomAppBar("Médicaments > catégorie"),
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
                                      child: Text("Liste des categories",
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
                                                  AddCategories(),
                                              transitionDuration: Duration.zero,
                                            ),
                                          );
                                        },
                                        child: Text("Ajouter une catégorie",
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
                                          future: fetch.fetchCategories(),
                                          builder: (ctx, snapshot) {
                                            List<CategoriesModel> categories =
                                                snapshot.data;
                                            return (snapshot.hasData)
                                                ? DataTable(
                                                    columns: [
                                                      DataColumn(
                                                        label: Text("Categorie",
                                                            style:
                                                                medicamentBar),
                                                      ),
                                                      DataColumn(
                                                        label: Text("Image",
                                                            style:
                                                                medicamentBar),
                                                      ),
                                                      DataColumn(
                                                        label: Text("Actions",
                                                            style:
                                                                medicamentBar),
                                                      ),
                                                    ],
                                                    rows: categories
                                                        .map(
                                                          (entry) => DataRow(
                                                            cells: <DataCell>[
                                                              DataCell(Text(
                                                                  entry
                                                                      .category,
                                                                  style: TextStyle(
                                                                      color:
                                                                          kGreyTitle,
                                                                      fontFamily:
                                                                          "Montserrat",
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          16))),
                                                              DataCell(SizedBox(
                                                                width: 40,
                                                                height: 40,
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl:
                                                                      "http://51.105.246.66:8089/storage/" +
                                                                          entry
                                                                              .file,
                                                                  placeholder: (context,
                                                                          url) =>
                                                                      new CircularProgressIndicator(),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      new Icon(Icons
                                                                          .error),
                                                                ),
                                                              )),
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
                                                                          http.post(
                                                                            Uri.parse('http://51.105.246.66:8089/v1/delete/category/' +
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
                                          })
                                    ],
                                  )),
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
