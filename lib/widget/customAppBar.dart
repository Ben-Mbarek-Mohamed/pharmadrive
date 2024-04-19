import 'dart:convert';

import 'package:dashboard/api/fetchData/getPharmacien.dart';
import 'package:dashboard/api/models/pharmacien.dart';
import 'package:dashboard/constants/textStyles.dart';
import 'package:dashboard/pages/params_profil.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final String titre;
  CustomAppBar(this.titre, {Key key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String name ="";

  fetchDataUser getUser = fetchDataUser();

  @override
  void initState() {
    super.initState();
    getPharmacien();
  }

  getPharmacien() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    if(_pref.get('id') != null){
      String nom = await getUser.getuser().then((value) => value.representant);
      setState(() {
        name = nom;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(widget.titre, style: kBasicAppBarTextStyle),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text( (name) != null ? "$name" : "admin",
                      style: kMeduim1TextStyle),
                ),
                Icon(Icons.verified_rounded, color: Colors.white ,)
              ],
            ),
          ),
          IconButton(
            iconSize: 35.0,
            icon: Icon(Icons.person_outline),
            tooltip: (name) != null ? "$name" : "admin",
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      ParamProfil(),
                  transitionDuration: Duration.zero,
                ),
              );
            },
          ),
        ],
        shadowColor: Colors.black12,
        backgroundColor: Color(0xFF21ba19));
  }
}
