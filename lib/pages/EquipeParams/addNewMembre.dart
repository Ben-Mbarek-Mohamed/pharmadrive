import 'package:dashboard/constants/colors.dart';
import 'package:dashboard/constants/style.dart';
import 'package:dashboard/constants/textStyles.dart';
import 'package:dashboard/widget/customAppBar.dart';
import 'package:dashboard/widget/forms/input.dart';
import 'package:dashboard/widget/menu_side.dart';
import 'package:flutter/material.dart';

class ParamsEquipeNewMembre extends StatefulWidget {
  @override
  _ParamsEquipeNewMembre createState() => _ParamsEquipeNewMembre();
}

class _ParamsEquipeNewMembre extends State<ParamsEquipeNewMembre> {
  showAlertDialog() {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("PharmaDrive"),
      content: Text("User ajouté"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  int _value = 1;
  @override
  Widget build(BuildContext context) {
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

                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 15.0, right: 15.0),
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
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child:
                                  Text("Adresse email", style: kcardTextStyle),
                            ),
                            Container(
                                width: 400,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: InputField(
                                        label: "", content: "adresse email"),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child:
                                  Text("Mot de passe", style: kcardTextStyle),
                            ),
                            Container(
                                width: 400,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: InputField(
                                      label: "", content: "PharmadriveUser"),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 20, bottom: 8),
                              child:
                                  Text("Autorisations", style: kcardTextStyle),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
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
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: 1,
                                          groupValue: _value,
                                          onChanged: (int value) {
                                            setState(() {
                                              _value = value;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Accès administrateur",
                                            style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
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
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: 2,
                                          groupValue: _value,
                                          onChanged: (int value) {
                                            setState(() {
                                              _value = value;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Accès lecture",
                                            style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  )),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      showAlertDialog();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 50, right: 10),
                                      child: Container(
                                        margin: EdgeInsets.only(right: 40),
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        alignment: Alignment.center,
                                        width: double.maxFinite,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 16),
                                        child: Text(
                                          "Ajouter",
                                          style: TextStyle(color: Colors.white),
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
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 50),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 40, right: 20),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFFF2F2F2),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        alignment: Alignment.center,
                                        width: double.maxFinite,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 16),
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
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
