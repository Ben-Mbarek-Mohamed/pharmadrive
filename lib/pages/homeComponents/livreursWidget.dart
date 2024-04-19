
import 'package:flutter/material.dart';

import '../homePage.dart';
import '../overview/widgets/info_card.dart';

Widget LivreursWidget(context,Details details){
  return InfoCard(
    iconData: Icons.local_shipping,
    color: HexColor("FFD770"),
    title: "Livreurs",
    value: (details.lNum != null)
        ? details.lNum.toString()
        : '0',
    onTap: () =>showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 600,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Livreurs',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'fermer',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.green),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ID Livreur',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Nom',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Mail',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),

                            Text(
                              'Phone',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Id societe',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Adresse',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              width: 0.1,
                            )
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.3,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Container(),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('CommadesScreen');
              },
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'View all >',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.green,
                      fontSize: 20),
                ),
              ),
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