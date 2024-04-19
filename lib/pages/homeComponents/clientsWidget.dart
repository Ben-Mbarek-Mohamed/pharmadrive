import 'package:flutter/material.dart';

import '../../widget/clientsDetails.dart';
import '../homePage.dart';
import '../overview/widgets/info_card.dart';

Widget ClientsWidget(context,details){
  return InfoCard(
    iconData: Icons.face,
    color: HexColor("369FFF"),
    title: "Clients",
    value: details.clientNum.toString(),
    onTap: () => showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Clients',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Container(
              height:
              MediaQuery.of(context).size.width *
                  0.4,
              width:
              MediaQuery.of(context).size.width *
                  0.6,
              child: ClientDetails(
                  clients: details.allCclients),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ),
  );
}