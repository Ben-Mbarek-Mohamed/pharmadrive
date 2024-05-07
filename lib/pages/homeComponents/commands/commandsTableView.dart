import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../Models/commande.dart';
import '../../../Models/medicament.dart';
import '../../../provider/providerCommandes.dart';



class CommandsTableView extends StatefulWidget {
  const CommandsTableView({Key key}) : super(key: key);

  @override
  State<CommandsTableView> createState() => _CommandsTableViewState();
}

class _CommandsTableViewState extends State<CommandsTableView> {
  bool sort = true;

  // onsortColum(int columnIndex, bool ascending) {
  //   if (columnIndex == 0) {
  //     if (ascending) {
  //       commandsData.sort((a, b) => a.id.compareTo(b.id));
  //     } else {
  //       commandsData.sort((a, b) => b.id.compareTo(a.id));
  //     }
  //   }
  // }

  getDetails() async {
    String url = "http://localhost:8089/v1/allcommandes";
    var responce = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    if (responce.statusCode == 200) {
      print(responce.statusCode);
      List allCommandes = jsonDecode(responce.body);
      if (mounted) {
        List<Commande> data =
            allCommandes.map((e) => Commande.fromJson(e)).toList();
        setState(() {
          setAllCommandes(context, data);
          setCommandes(context, data);
        });
      }
    }
  }

  @override
  void initState() {
    getDetails();
    super.initState();
  }

  TextEditingController medController = TextEditingController();
  TextEditingController clientController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProviderCommands>(context);
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
            sortAscending: sort,
            header: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Medicaments'),
                SizedBox(width: 10,),
                Container(
                  width: 200,
                  child: TextFormField(
                    controller: medController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.green, width: 1.7)),
                    ),
                    onChanged: (value) {
                      if (value == '') {
                        List<Commande> commands = getAllCommandes(context);
                        setCommandes(context, commands);
                      } else {
                        setState(() {
                          List<Commande> filtredDate = [];
                          getAllCommandes(context).forEach((commande) {
                            for (int i = 0;
                                i < commande.medicaments.length;
                                i++) {
                              Medicament medicament = commande.medicaments[i];
                              if (medicament.nomMedicament
                                  .toLowerCase()
                                  .contains(value.toLowerCase())) {
                                filtredDate.add(commande);
                                break;
                              }
                            }
                          });
                          setCommandes(context, filtredDate);
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Client'),
                SizedBox(width: 10,),
                Container(
                  width: 200,
                  child: TextFormField(
                    controller: clientController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                          BorderSide(color: Colors.green, width: 1.7)),
                    ),
                    onChanged: (value) {
                      if (value == '') {
                        List<Commande> commands = getAllCommandes(context);
                        setCommandes(context, commands);
                      } else {
                        setState(() {
                          List<Commande> filtredDate = [];
                          getAllCommandes(context).forEach((commande) {
                            if(commande.idClient.toLowerCase().contains(value.toLowerCase())){
                              filtredDate.add(commande);
                            }

                          });
                          setCommandes(context, filtredDate);
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.search),
              ],
            ),
            source: RowSource(
              context: context,
              myData:
                  (getCommandes(context) != null) ? getCommandes(context) : [],
              count: (getCommandes(context) != null)
                  ? getCommandes(context).length
                  : 0,
            ),
            rowsPerPage: 8,
            columnSpacing: 8,
            columns: [
              DataColumn(
                  label: const Text(
                    "ID Commande",
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
                  "Medicaments",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.green),
                ),
              ),
              const DataColumn(
                label: Text(
                  "Nom User",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.green),
                ),
              ),
              const DataColumn(
                label: Text(
                  "Montant",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.green),
                ),
              ),
              const DataColumn(
                label: Text(
                  "date et heure",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      color: Colors.green),
                ),
              ),
              const DataColumn(
                label: Text(
                  "Nom medecin",
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

/////////////////////////////////add the column here
DataRow recentFileDataRow(Commande data, context) {
  return DataRow(
    cells: [
      DataCell(Container(
          width: 150,
          child: Text(
            data.id ?? "id",
            overflow: TextOverflow.ellipsis,
          ))),
      DataCell(
        ElevatedButton(
          onPressed: () {
            _showMedicamentList(context, data);
          },
          child: Text("consulter"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
        ),
      ),
      DataCell(Text(data.idClient.toString())),
      DataCell(Text(data.ammount.toString())),
      DataCell(Text(data.date.toString())),
      DataCell(Text(data.nomMedecin.toString())),
      DataCell(
        Row(
          children: [
            IconButton(
                onPressed: () {
                  _showEditDialog(context, data);
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
            IconButton(
                onPressed: () {
                  _showConfirmationDialog(context, () async {
                    String url = 'http://localhost:8089/v1/deleteCommande/';
                    var responce =
                        await http.delete(Uri.parse(url + '${data.id}'));
                    if (responce.statusCode == 200) {
                      List<Commande> cmds = getCommandes(context);
                      cmds.remove(data);
                      setCommandes(context, cmds);
                    }
                  }, data);
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

// class Data {
//   String name;
//   int phone;
//   int Age;
//
//   Data({@required this.name, @required this.phone, @required this.Age});
// }

// List<Data> myData = [
//   Data(name: "Khaliq", phone: 09876543, Age: 28),
//   Data(name: "David", phone: 6464646, Age: 30),
//   Data(name: "Kamal", phone: 8888, Age: 32),
//   Data(name: "Ali", phone: 3333333, Age: 33),
//   Data(name: "Muzal", phone: 987654556, Age: 23),
//   Data(name: "Taimu", phone: 46464664, Age: 24),
//   Data(name: "Mehdi", phone: 5353535, Age: 36),
//   Data(name: "Rex", phone: 244242, Age: 38),
//   Data(name: "Alex", phone: 323232323, Age: 29),
// ];
void _showMedicamentList(BuildContext context, Commande commande) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          commande.id,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Container(
          height: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green)),
          child: Column(
            children: [
              Container(
                width: 600,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Medicament')),
                    DataColumn(label: Text('Prix')),
                    DataColumn(label: Text('Quantite')),
                    DataColumn(label: Text('Stock')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: getRows(commande, context),
                  dividerThickness: 0,
                ),
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Fermer",
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      );
    },
  );
}

List<DataRow> getRows(Commande commande, context) {
  final provider = Provider.of<MyProviderCommands>(context);
  List<Medicament> medicaments = commande.medicaments;
  return medicaments.map((Medicament medicament) {
    final cells = [
      medicament.nomMedicament,
      medicament.prix,
      medicament.quantite,
      medicament.quantite,
      Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              color: Colors.green,
            ),
          ),
          IconButton(
              onPressed: () {
                _showConfirmationDialogMedicament(context, () async {
                  String url = 'http://localhost:8089/v1/updateCommande';
                  commande.medicaments.remove(medicament);
                  var response = await http.put(
                    Uri.parse(url),
                    body: jsonEncode(commande.toJson()),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                  );
                  if (response.statusCode == 200) {
                    int index = getCommandes(context)
                        .indexWhere((element) => element.id == commande.id);
                    List<Commande> newData = getCommandes(context);
                    newData[index] = commande;
                    setCommandes(context, newData);
                    Navigator.of(context).pop();
                  }
                }, medicament);
              },
              icon: Icon(
                Icons.delete_forever_outlined,
                color: Colors.green,
              ))
        ],
      ),
    ];
    return DataRow(cells: getCells(cells));
  }).toList();
}

List<DataCell> getCells(List<dynamic> cells) => cells
    .map((e) => (e is Widget) ? DataCell(e) : DataCell(Text('${e}')))
    .toList();

Future<void> _showEditDialog(BuildContext context, Commande data) async {
  Commande orderInfo = data;
  final TextEditingController idController =
      TextEditingController(text: orderInfo.id);
  final TextEditingController clientController =
      TextEditingController(text: orderInfo.idClient);
  final TextEditingController moneyController = TextEditingController(
      text: (orderInfo.ammount != null) ? '${orderInfo.ammount}' : null);
  final TextEditingController statController =
      TextEditingController(text: orderInfo.etat);
  final TextEditingController dateTimeController =
      TextEditingController(text: orderInfo.date);
  final TextEditingController medController =
      TextEditingController(text: orderInfo.nomMedecin);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Edit Order'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Id Commande: ${data.id}'),
              TextField(
                controller: clientController,
                decoration: InputDecoration(labelText: 'User Name'),
              ),
              TextField(
                controller: moneyController,
                decoration: InputDecoration(labelText: 'Amount'),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}')),
                ],
              ),
              TextField(
                controller: dateTimeController,
                decoration: InputDecoration(labelText: 'Date & Time'),
              ),
              TextField(
                controller: medController,
                decoration: InputDecoration(labelText: 'Medecin'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              String url = 'http://localhost:8089/v1/updateCommande';
              Commande cmd = Commande(
                id: data.id,
                idClient: clientController.text,
                ammount: (moneyController.text != null)
                    ? double.tryParse(moneyController.text.replaceAll(',', ''))
                    : data.ammount,
                date: dateTimeController.text,
                nomMedecin: medController.text,
                etat: statController.text,
                idPharamcie: data.idPharamcie,
                medicaments: data.medicaments,
              );

              var response = await http.put(
                Uri.parse(url),
                body: jsonEncode(cmd.toJson()),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
              );
              print(response.statusCode);
              if (response.statusCode == 200) {
                int index = getCommandes(context)
                    .indexWhere((element) => element.id == cmd.id);
                List<Commande> newData = getCommandes(context);
                newData[index] = cmd;
                setCommandes(context, newData);
                Navigator.of(context).pop();
              }
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
}

Future<void> _showConfirmationDialog(
    BuildContext context, Function onDelete, Commande commande) async {
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
              Text('Order Id : ${commande.id}'),
              Text('Client  : ${commande.idClient}'),
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

Future<void> _showConfirmationDialogMedicament(
    BuildContext context, Function onDelete, Medicament medicament) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmation'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Are you sure you want to delete this Medicine?'),
              Text('Medicine : ${medicament.nomMedicament}'),
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
