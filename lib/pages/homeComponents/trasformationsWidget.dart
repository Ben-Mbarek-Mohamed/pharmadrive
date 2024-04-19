
import 'package:flutter/material.dart';
import '../homePage.dart';
import '../overview/widgets/info_card.dart';

Widget TransWidget(context, Details details){
  return InfoCard(
    iconData: Icons.currency_exchange_outlined,
    color: HexColor("60BCD3"),
    title: "Taux de transformations",
    value: "300",
    onTap: () {},
  );
}