import 'dart:convert';

import 'package:dashboard/Models/livreur.dart';
import 'package:dashboard/provider/providerLivreur.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main(){
  runApp(
  MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>MyLivreurProvider()),
  ],
  child: MaterialApp(
    home: LivreurTableView(),
    debugShowCheckedModeBanner: false,
  ),)
  );
}

class LivreurTableView extends StatefulWidget {


  @override
  State<LivreurTableView> createState() => _LivreurTableViewState();
}


class _LivreurTableViewState extends State<LivreurTableView> {
  getDetails() async {
    String url = "http://51.105.246.66:8089/v1/livreurs/all";
    var responce = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    if (responce.statusCode == 200) {
      print(responce.statusCode);
      List allLivreurs = jsonDecode(responce.body);
      if (mounted) {
        List<Livreur> data =
        allLivreurs.map((e) => Livreur.fromJson(e)).toList();
        setState(() {
          setLivreurs(context, data);
          setAllLivreurs(context, data);
        });
      }
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyLivreurProvider>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: PaginatedDataTable(
            showFirstLastButtons: true,
            arrowHeadColor: Colors.green,
            actions: [],
            sortColumnIndex: 4,
            //sortAscending: sort,
            header: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('Medicaments'),
                // SizedBox(width: 10,),
                // Container(
                //   width: 200,
                //   child: TextFormField(
                //     controller: medController,
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20),
                //           borderSide:
                //           BorderSide(color: Colors.green, width: 1.7)),
                //     ),
                //     onChanged: (value) {
                //       if (value == '') {
                //         List<Commande> commands = getAllCommandes(context);
                //         setCommandes(context, commands);
                //       } else {
                //         setState(() {
                //           List<Commande> filtredDate = [];
                //           getAllCommandes(context).forEach((commande) {
                //             for (int i = 0;
                //             i < commande.medicaments.length;
                //             i++) {
                //               Medicament medicament = commande.medicaments[i];
                //               if (medicament.nomMedicament
                //                   .toLowerCase()
                //                   .contains(value.toLowerCase())) {
                //                 filtredDate.add(commande);
                //                 break;
                //               }
                //             }
                //           });
                //           setCommandes(context, filtredDate);
                //         });
                //       }
                //     },
                //   ),
                // ),
                // SizedBox(
                //   width: 20,
                // ),
                // Text('Client'),
                // SizedBox(width: 10,),
                // Container(
                //   width: 200,
                //   child: TextFormField(
                //     controller: clientController,
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20),
                //           borderSide:
                //           BorderSide(color: Colors.green, width: 1.7)),
                //     ),
                //     onChanged: (value) {
                //       if (value == '') {
                //         List<Commande> commands = getAllCommandes(context);
                //         setCommandes(context, commands);
                //       } else {
                //         setState(() {
                //           List<Commande> filtredDate = [];
                //           getAllCommandes(context).forEach((commande) {
                //             if(commande.idClient.toLowerCase().contains(value.toLowerCase())){
                //               filtredDate.add(commande);
                //             }
                //
                //           });
                //           setCommandes(context, filtredDate);
                //         });
                //       }
                //     },
                //   ),
                // ),
                // SizedBox(
                //   width: 20,
                // ),
                Icon(Icons.search),
              ],
            ),
            source: RowSource(
              context: context,
              myData:
              (getLivreurs(context) != null) ? getLivreurs(context) : [],
              count: (getLivreurs(context) != null)
                  ? getLivreurs(context).length
                  : 0,
            ),
            rowsPerPage: 8,
            columnSpacing: 8,
            columns: [
              DataColumn(
                label: const Text(
                  "id_livreur",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.green),
                ),
                // onSort: (columnIndex, ascending) {
                //   setState(() {
                //     sort = !sort;
                //   });
                //   //onsortColum(columnIndex, ascending);
                // }
              ),
              const DataColumn(
                label: Text(
                  "Name",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.green),
                ),
              ),
              const DataColumn(
                label: Text(
                  "id_societe",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.green),
                ),
              ),
              const DataColumn(
                label: Text(
                  "id_pharmacie",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.green),
                ),
              ),

              const DataColumn(
                label: Text(
                  "adresse",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.green),
                ),
              ),
              const DataColumn(
                label: Text(
                  "phone",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.green),
                ),
              ),
              const DataColumn(
                label: Text(
                  "email",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.green),
                ),
              ),
              const DataColumn(
                label: Text(
                  "car",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.green),
                ),
              ),
              const DataColumn(
                label: Text(
                  "Actions",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


List<DataCell> getCells(List<dynamic> cells) => cells
    .map((e) => (e is Widget) ? DataCell(e) : DataCell(Text('${e}')))
    .toList();

DataRow recentFileDataRow(Livreur data, context) {
  return DataRow(
    cells: [
      DataCell(Container(
          width: 150,
          child: Text(
            data.id_livreur ?? "id",
            overflow: TextOverflow.ellipsis,
          ))),
      DataCell(Text(data.name.toString())),
      DataCell(Text(data.idSocietwLivreur.toString())),
      DataCell(Text(data.id_pharmacie.toString())),
      DataCell(Text(data.adresse.toString())),
      DataCell(Text(data.phone.toString())),
      DataCell(Text(data.email.toString())),
      DataCell(Text(data.car.toString())),

      DataCell(
        Row(
          children: [
            IconButton(
                onPressed: () {

                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
            IconButton(
                onPressed: () {
                  _showConfirmationDialog(
                    context,
                      (){
                        List<Livreur> val = getLivreurs(context);
                        val.remove(data);
                        setLivreurs(context, val);
                      },
                    data
                  );

                },
                icon: Icon(
                  Icons.delete_forever_outlined,
                  color: Colors.green,
                ))
          ],
        ),
      )
    ],
  );
}

class RowSource extends DataTableSource {
  final BuildContext context;
  var myData;
  final count;

  RowSource({
    @required this.context,
    @required this.myData,
    @required this.count,
  });

  @override
  DataRow getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData[index], context);
    } else
      return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}


Future<void> _showConfirmationDialog(
    BuildContext context, Function onDelete, Livreur data) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmation'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Are you sure you want to delete this order?'),
              Text('Livreur Id : ${data.id_livreur}'),
              Text('Name  : ${data.name}'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              onDelete(); // Call the onDelete function passed from the caller
            },
          ),
        ],
      );
    },
  );
}