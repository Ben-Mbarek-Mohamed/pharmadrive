import 'package:flutter/material.dart';

import '../homePage.dart';
import '../overview/widgets/info_card.dart';
import '../overview/widgets/revenue_section_large.dart';
Widget PharmaciesWidget(context, Details details){
  return InfoCard(
    iconData: Icons.add_box_outlined,
    color: HexColor("7DCA7D"),
    title: "Pharmacies",
    value: (details.pNum != null)
        ? details.pNum.toString()
        : '0',
    onTap: () => showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RevenueSectionLarge(
              pharmacies: details.allpharmacies,
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