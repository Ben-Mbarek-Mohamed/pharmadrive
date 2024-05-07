import 'package:flutter/material.dart';

import '../../../Models/livreur.dart';
class LivreurTable extends StatelessWidget {
  final List<Livreur> livreurs;
  const LivreurTable({@required this.livreurs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: livreurs.length,
      itemBuilder: (context, index) {
        final livreur = livreurs[index];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120,
                    alignment: Alignment.center,
                    child: Text(
                      ' ${livreur.id_livreur} ',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(),
                  Container(
                    width: 100,
                    child: Text(
                      '${livreur.name}',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 145,
                    alignment: Alignment.center,
                    child: Text(
                      '${livreur.email}',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 145,
                    alignment: Alignment.center,
                    child: Text(
                      '${livreur.phone}',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 145,
                    alignment: Alignment.center,
                    child: Text(
                      '${livreur.idSocietwLivreur}',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 145,
                    alignment: Alignment.center,
                    child: Text(
                      '${livreur.adresse}',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
}
