import 'package:dashboard/api/fetchData/getPharmacien.dart';
import 'package:dashboard/api/models/pharmacien.dart';
import 'package:dashboard/constants/colors.dart';
import 'package:dashboard/constants/textStyles.dart';
import 'package:dashboard/widget/customAppBar.dart';
import 'package:dashboard/widget/menu_side.dart';
import 'package:flutter/material.dart';

import 'addNewMembre.dart';

class ParamsEquipe extends StatelessWidget {
  const ParamsEquipe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    fetchDataUser getUser = fetchDataUser();
    return Container(
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 5,
              child: MenuSide(),
            ),
            Expanded(
              flex: 20,
              child: Scaffold(
                backgroundColor: Colors.black12,
                appBar: CustomAppBar("Paramétres"),
                ///// body will change with widgets dynamiclly

                body: Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 50, bottom: 8),
                            child: Text("Membres", style: kcardTextStyle),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 8, bottom: 8),
                            child: Text(
                                "Gérez qui a accès à ou ajoutez de nouveaux membres à l’équipe.",
                                style: kNomralTextStyle),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 8, bottom: 8),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  color: kprimaryColor,
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation1,
                                                  animation2) =>
                                              ParamsEquipeNewMembre(),
                                          transitionDuration: Duration.zero,
                                        ),
                                      );
                                    },
                                    child: Text(" Ajouter membre",
                                        style: TextStyle(
                                            color: kprimaryColor,
                                            fontFamily: "Montserrat",
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16))),
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 7,
                                      offset: Offset(7, 8))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image(
                                      image: AssetImage(
                                          "assets/icons/googleicon.png")),
                                  FutureBuilder<ProfileModel>(
                                      future: getUser.getuser(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return snapshot.hasData
                                              ? Builder(
                                                  builder: (context) => Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              11.0,
                                                                          top:
                                                                              12,
                                                                          right:
                                                                              11,
                                                                          bottom:
                                                                              8),
                                                                      child: Text(
                                                                          "user name",
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontStyle:
                                                                                FontStyle.normal,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                12,
                                                                          )),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              11.0,
                                                                          top:
                                                                              12,
                                                                          right:
                                                                              11,
                                                                          bottom:
                                                                              8),
                                                                      child: Text(
                                                                          "Owner",
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Colors.redAccent,
                                                                            fontStyle:
                                                                                FontStyle.normal,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                12,
                                                                          )),
                                                                    )
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          11.0),
                                                                  child: Text(
                                                                      "${snapshot.data.email}",
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontSize:
                                                                            12,
                                                                      )),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ))
                                              : CircularProgressIndicator();
                                        }
                                      })
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
