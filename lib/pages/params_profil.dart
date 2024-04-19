import 'package:dashboard/api/fetchData/getPharmacien.dart';
import 'package:dashboard/api/models/pharmacien.dart';
import 'package:dashboard/constants/colors.dart';
import 'package:dashboard/constants/style.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dashboard/widget/customAppBar.dart';
import 'package:dashboard/widget/menu_side.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ParamProfil extends StatefulWidget {
  const ParamProfil({Key key}) : super(key: key);

  @override
  State<ParamProfil> createState() => _ParamProfilState();
}

class _ParamProfilState extends State<ParamProfil> {
  
  String locationMessage = "";

  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        locationMessage =
            "Latitude: ${position.latitude}\nLongitude: ${position.longitude}";
      });
      print(locationMessage);
    } catch (e) {
      print(e);
    }
  }

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

                  body: Container(
                    child: Scaffold(
                      body: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 20,
                              child: Scaffold(
                                body: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border.all(
                                              color: Color(0xFFFF2F2F2)),
                                          color: Colors.white),
                                      child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: FutureBuilder<ProfileModel>(
                                              future: getUser.getuser(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return Builder(
                                                    builder: (context) =>
                                                        Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20,
                                                                  top: 10,
                                                                  bottom: 8),
                                                          child: Row(
                                                            children: [
                                                              Text("Paramétres",
                                                                  style: TextStyle(
                                                                      color:
                                                                          primaryColor,
                                                                      fontFamily:
                                                                          "Montserrat",
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          16)),
                                                                          SizedBox(width: MediaQuery.of(context).size.width *0.4,),
                                                              TextButton(
                                                                onPressed: () {
                                                                  _getCurrentLocation();
                                                             showDialog<String>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                    title: const Text(
                                                        'Pharmadrive'),
                                                    content: Text(
                                                        'localisation à jour'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context,
                                                                'Cancel'),
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context, 'OK'),
                                                        child: const Text('OK'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                                               
                                                                },
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  primary: Colors
                                                                      .blue, // Text color
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white, // Background color
                                                                  padding: EdgeInsets.symmetric(
                                                                      vertical:
                                                                          12,
                                                                      horizontal:
                                                                          24), // Padding
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0), // Button border radius
                                                                    side: BorderSide(
                                                                        color: Colors
                                                                            .blue), // Border color
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                  "Mettre à jour ma position", // Button label
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        16.0, // Text size
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),

                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20,
                                                                  top: 20,
                                                                  bottom: 8),
                                                          child: Text("Nom",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF3F4B57),
                                                                  fontFamily:
                                                                      "Montserrat",
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      14)),
                                                        ),
                                                        Container(
                                                            width: 400,
                                                            decoration:
                                                                BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                    color: Colors.white,
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .black38,
                                                                      blurRadius:
                                                                          2,
                                                                      offset:
                                                                          Offset(
                                                                              1,
                                                                              2))
                                                                ]),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      14.0),
                                                              child: Text(
                                                                  "${snapshot.data.name}",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          "Montserrat",
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          14)),
                                                            )),

                                                        //////email
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20,
                                                                  top: 20,
                                                                  bottom: 8),
                                                          child: Text("Email",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF3F4B57),
                                                                  fontFamily:
                                                                      "Montserrat",
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      14)),
                                                        ),
                                                        Container(
                                                            width: 400,
                                                            decoration:
                                                                BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                    color: Colors.white,
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .black38,
                                                                      blurRadius:
                                                                          2,
                                                                      offset:
                                                                          Offset(
                                                                              1,
                                                                              2))
                                                                ]),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      14.0),
                                                              child: Text(
                                                                  "${snapshot.data.email}",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          "Montserrat",
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          14)),
                                                            )),

                                                        ///telephone
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20,
                                                                  top: 20,
                                                                  bottom: 8),
                                                          child: Text(
                                                              "N° de téléphone",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF3F4B57),
                                                                  fontFamily:
                                                                      "Montserrat",
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      14)),
                                                        ),
                                                        Container(
                                                            width: 400,
                                                            decoration:
                                                                BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                    color: Colors.white,
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .black38,
                                                                      blurRadius:
                                                                          2,
                                                                      offset:
                                                                          Offset(
                                                                              1,
                                                                              2))
                                                                ]),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      14.0),
                                                              child: Text(
                                                                  (snapshot.data
                                                                              .phone) !=
                                                                          null
                                                                      ? "${snapshot.data.phone}"
                                                                      : "55 78 98 98",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          "Montserrat",
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          14)),
                                                            )),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20,
                                                                  top: 20,
                                                                  bottom: 8),
                                                          child: Text(
                                                              "Mot de passe",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF3F4B57),
                                                                  fontFamily:
                                                                      "Montserrat",
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      14)),
                                                        ),
                                                        Container(
                                                            width: 400,
                                                            decoration:
                                                                BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                    color: Colors.white,
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .black38,
                                                                      blurRadius:
                                                                          2,
                                                                      offset:
                                                                          Offset(
                                                                              1,
                                                                              2))
                                                                ]),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      14.0),
                                                              child: Text(
                                                                  "*******",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          "Montserrat",
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          14)),
                                                            )),
                                                        Container(
                                                          width: 400,
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(10)),
                                                                  color: Colors.white,
                                                                  boxShadow: [
                                                                BoxShadow(
                                                                    color: Colors
                                                                        .black38,
                                                                    blurRadius:
                                                                        2,
                                                                    offset:
                                                                        Offset(
                                                                            1,
                                                                            2))
                                                              ]),
                                                        ),

                                                        Container(
                                                            child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: InkWell(
                                                                onTap: () {},
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 50,
                                                                      left: 50,
                                                                      right:
                                                                          10),
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            40),
                                                                    decoration: BoxDecoration(
                                                                        color:
                                                                            primaryColor,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5)),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    width: double
                                                                        .maxFinite,
                                                                    padding: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            16),
                                                                    child: Text(
                                                                      "Enregistrer",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 100,
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: InkWell(
                                                                onTap: () {},
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 50,
                                                                      right:
                                                                          50),
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets.only(
                                                                        left:
                                                                            40,
                                                                        right:
                                                                            20),
                                                                    decoration: BoxDecoration(
                                                                        color: Color(
                                                                            0xFFFF2F2F2),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5)),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    width: double
                                                                        .maxFinite,
                                                                    padding: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            16),
                                                                    child: Text(
                                                                      "Cancel",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ))
                                                      ],
                                                    ),
                                                  );
                                                } else {
                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                              })
                                          ////
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
