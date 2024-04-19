import 'package:dashboard/constants/textStyles.dart';
import 'package:dashboard/pages/Categories/categories.dart';
import 'package:dashboard/pages/LoginRegister/auth.dart';
import 'package:dashboard/pages/commandes.dart';
import 'package:dashboard/pages/documents_legaux.dart';
import 'package:dashboard/pages/factures_ab.dart';
import 'package:dashboard/pages/homePage.dart';
import 'package:dashboard/pages/livraison_docs_legaux.dart';
import 'package:dashboard/pages/livraisons_details_person.dart';
import 'package:dashboard/pages/medicaments/medicaments.dart';
import 'package:dashboard/pages/EquipeParams/params_equipe.dart';
import 'package:dashboard/pages/params_profil.dart';
import 'package:dashboard/pages/publicites.dart';
import 'package:dashboard/pages/visio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuSide extends StatelessWidget {
  const MenuSide({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    deleteData() async {
      SharedPreferences _pref = await SharedPreferences.getInstance();

      await _pref.clear();
    }

    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Image(image: AssetImage("assets/images/logo.png")),
            ),
          ),
          ListTile(
            title: Text('Dashboard', style: kSideMEnuTextStyle),
            leading: Icon(Icons.dashboard, color: Color(0xFF21ba19)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => HomePage(),
                  transitionDuration: Duration.zero,
                ),
              );
            },
          ),
          ListTile(
            title: Text('Vidéo Conférence', style: kSideMEnuTextStyle),
            leading: Icon(Icons.video_call, color: Color(0xFF21ba19)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => Visio(),
                  transitionDuration: Duration.zero,
                ),
              );
            },
          ),
          ListTile(
            title: Text('Documents Légaux', style: kSideMEnuTextStyle),
            leading: Icon(Icons.playlist_add_check, color: Color(0xFF21ba19)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => Docs(),
                  transitionDuration: Duration.zero,
                ),
              );
            },
          ),
          ExpansionTile(
            title: Text("Médicaments", style: kSideMEnuTextStyle),
            leading: Icon(Icons.medical_services, color: Color(0xFF21ba19)),
            children: <Widget>[
              Center(
                child: ListTile(
                  title: Text("Catégories",
                      textAlign: TextAlign.center,
                      style: kUnderSideMEnuTextStyle),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            Categories(),
                        transitionDuration: Duration.zero,
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: ListTile(
                    title: Text("Médicaments",
                        textAlign: TextAlign.center,
                        style: kUnderSideMEnuTextStyle),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              Medicaments(),
                          transitionDuration: Duration.zero,
                        ),
                      );
                    }),
              ),
            ],
          ),
          ListTile(
            title: Text('Commandes', style: kSideMEnuTextStyle),
            leading: Icon(Icons.list_alt, color: Color(0xFF21ba19)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => Commandes(),
                  transitionDuration: Duration.zero,
                ),
              );
            },
          ),
          ExpansionTile(
            title: Text("Livraisons", style: kSideMEnuTextStyle),
            leading: Icon(Icons.local_shipping, color: Color(0xFF21ba19)),
            children: <Widget>[
              Center(
                child: ListTile(
                  title: Text("Détais Personnels",
                      textAlign: TextAlign.center,
                      style: kUnderSideMEnuTextStyle),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            LivraisonPerso(),
                        transitionDuration: Duration.zero,
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: ListTile(
                    title: Text("Documents Légaux",
                        textAlign: TextAlign.center,
                        style: kUnderSideMEnuTextStyle),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              LivraisonDocs(),
                          transitionDuration: Duration.zero,
                        ),
                      );
                    }),
              ),
            ],
          ),
          ListTile(
            title: Text('Publicités', style: kSideMEnuTextStyle),
            leading: Icon(Icons.campaign, color: Color(0xFF21ba19)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => Pubs(),
                  transitionDuration: Duration.zero,
                ),
              );
            },
          ),
          ListTile(
            title: Text('Factures Pharmacie', style: kSideMEnuTextStyle),
            leading: Icon(Icons.receipt, color: Color(0xFF21ba19)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => Factures(),
                  transitionDuration: Duration.zero,
                ),
              );
            },
          ),
          ExpansionTile(
            title: Text("Paramétres", style: kSideMEnuTextStyle),
            leading: Icon(Icons.medical_services, color: Color(0xFF21ba19)),
            children: <Widget>[
              Center(
                child: ListTile(
                  title: Text(
                    "Profil",
                    textAlign: TextAlign.center,
                    style: kUnderSideMEnuTextStyle,
                  ),
                  onTap: () {
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
              ),
              Center(
                child: ListTile(
                    title: Text("Equipe",
                        textAlign: TextAlign.center,
                        style: kUnderSideMEnuTextStyle),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              ParamsEquipe(),
                          transitionDuration: Duration.zero,
                        ),
                      );
                    }),
              ),
            ],
          ),
          ListTile(
            title: Text('Déconnexion', style: kSideMEnuTextStyle),
            leading: Icon(Icons.logout, color: Color(0xFF21ba19)),
            onTap: () {
              deleteData();
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => Auth(),
                  transitionDuration: Duration.zero,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
