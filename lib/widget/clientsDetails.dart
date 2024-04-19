import 'package:flutter/material.dart';

import '../Models/client.dart';
class ClientDetails extends StatelessWidget {
  final List<Client> clients;

  const ClientDetails({Key key, this.clients}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clients.length,
      itemBuilder: (context, index) {
        final client = clients[index];

        return GestureDetector(
          onTap: () {

          },
          child: Card(
            child: ListTile(
              title: Text('Client ID: ${client.id}'),
              subtitle: Text('Matricule: ${client.matricule} - Client Name: ${client.nom_complet}'),
            ),
          ),
        );
      },
    );;
  }
}
