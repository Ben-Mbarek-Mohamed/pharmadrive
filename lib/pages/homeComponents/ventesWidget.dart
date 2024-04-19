import 'package:flutter/material.dart';

import '../homePage.dart';
import '../overview/widgets/info_card.dart';

Widget VentesWidget(context,Details details){
  return InfoCard(
    iconData: Icons.monetization_on,
    color: HexColor("A9AEB5"),
    title: "Ventes",
    value: "741",
    onTap: () {},
  );
}