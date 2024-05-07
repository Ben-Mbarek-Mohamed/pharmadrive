import 'package:flutter/material.dart';

import '../../../Models/commande.dart';

import '../../../Models/medicament.dart';

class CommandeTable extends StatelessWidget {
  final List<Commande> commands;

  CommandeTable({@required this.commands});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: commands.length,
      itemBuilder: (context, index) {
        final commande = commands[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' ${commande.id} ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${commande.idClient}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'EnCours',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showMedicamentList(context, commande);
                    },
                    child: Text("consulter"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                  ),
                ],
              ),
              Divider(),
            ],
          ),
        );
      },
    );
  }

  void _showMedicamentList(BuildContext context, Commande commande) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        List<Medicament> medicaments = commande.medicaments;
        return AlertDialog(
          title: Text(
            commande.id,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green)
            ),
            child: Column(
              children: [
                Container(
                    width: 400,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Medicament')),
                        DataColumn(label: Text('Prix')),
                        DataColumn(label: Text('Quantite')),
                        DataColumn(label: Text('Stock')),
                      ],
                      rows: getRows(medicaments),
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

  List<DataRow> getRows(List<Medicament> medicament) =>medicament.map((Medicament medicament){
    final cells = [medicament.nomMedicament,medicament.prix,medicament.quantite,medicament.quantite];
    return DataRow(cells: getCells(cells));
  }

  ).toList();

  List<DataCell> getCells(List<dynamic> cells) => cells.map((e) => DataCell(Text('${e}'))).toList();
}
