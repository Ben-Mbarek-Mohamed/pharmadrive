import 'dart:convert';

import 'package:dashboard/constants/colors.dart';
import 'package:dashboard/constants/textStyles.dart';
import 'package:dashboard/pages/factures_ab.dart';
import 'package:dashboard/widget/customAppBar.dart';
import 'package:dashboard/widget/forms/commandsTableView.dart';
import 'package:dashboard/widget/menu_side.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:http/http.dart' as http;

import '../Models/commande.dart';

class Commandes extends StatefulWidget {
  const Commandes({Key key}) : super(key: key);
  @override
  _OrdersScreen createState() => _OrdersScreen();
}

class _OrdersScreen extends State<Commandes> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool showLoadingIndicator = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
          body: Row(
            children: [
              (size.width>1200)?Container(
                  width: size.width*0.2,
                  child: MenuSide()
              ):SizedBox(),
              Container(
                width: (size.width>1200)?size.width*0.8:size.width,
                child: Scaffold(
                  drawer: (size.width<1200)?Drawer(child: MenuSide(),):SizedBox(),
                  backgroundColor: Colors.black12,
                  appBar: CustomAppBar("Commandes"),
                  ///// body will change with widgets dynamiclly

                  body: Container(
                    color: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: CommandsTableView(),
                    ),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}


