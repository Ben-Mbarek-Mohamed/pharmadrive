import 'package:dashboard/pages/homePage.dart';
import 'package:flutter/material.dart';

import '../overview/widgets/info_card.dart';

Widget VisistesWidget(context, Details details){
  return InfoCard(
    iconData: Icons.visibility_outlined,
    color: HexColor("D9DBDD"),
    title: "Visites",
    value: "15447",
    onTap: () {},
  );
}