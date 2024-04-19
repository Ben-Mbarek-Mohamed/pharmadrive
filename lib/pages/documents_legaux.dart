import 'package:dashboard/constants/colors.dart';
import 'package:dashboard/constants/textStyles.dart';
import 'package:dashboard/widget/customAppBar.dart';
import 'package:dashboard/widget/forms/date.dart';
import 'package:dashboard/widget/forms/dropdownitem.dart';
import 'package:dashboard/widget/forms/imageKbis.dart';
import 'package:dashboard/widget/forms/input.dart';
import 'package:dashboard/widget/forms/phoneadd.dart';
import 'package:dashboard/widget/forms/small_input.dart';
import 'package:dashboard/widget/menu_side.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class Docs extends StatefulWidget {
  Docs({Key key}) : super(key: key);

  @override
  _DocsState createState() => _DocsState();
}

class _DocsState extends State<Docs> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(

          body:Row(
            children: [
              (size.width>1200)?Container(
                  width: size.width*0.2,
                  child: MenuSide()
              ):SizedBox(),
              buildBodyDocument(size.width),
            ],
          ),
      ),
    );
  }
}




Widget buildBodyDocument(double widh){
  return Container(
    width: (widh>1200)?widh*0.8:widh,
    child: Scaffold(
      drawer: (widh<1200)?Drawer(child: MenuSide(),):SizedBox(),
      backgroundColor: Colors.black12,
      appBar: CustomAppBar("Données pharmacie"),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 15.0, top: 15.0),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius:
                BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 10,
                        child: Padding(
                          padding:
                          const EdgeInsets.only(left: 25.0),
                          child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.all(8.0),
                                  child: Text(
                                      "Données pharmacie partenaire",
                                      style: kcardTextStyle),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.all(4.0),
                                  child: InputField(
                                      label: "",
                                      content:
                                      "Nom et prénom du représentant légal"),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.all(4.0),
                                  child: InputField(
                                      label: "",
                                      content:
                                      "Dénomination  sociale"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4.0,
                                      right: 4.0,
                                      top: 4.0),
                                  child: Text("Statut",
                                      style:
                                      kUnderSideMEnuTextStyle),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.all(4.0),
                                  child: DropdownScreen(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4.0,
                                      right: 4.0,
                                      top: 4.0),
                                  child: Text("Code Naf",
                                      style:
                                      kUnderSideMEnuTextStyle),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4.0,
                                      right: 4.0,
                                      bottom: 4.0),
                                  child: InputField(
                                      label: "", content: ""),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4.0,
                                      right: 4.0,
                                      top: 4.0),
                                  child: Text("N°TVA intra",
                                      style:
                                      kUnderSideMEnuTextStyle),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4.0,
                                      right: 4.0,
                                      bottom: 4.0),
                                  child: InputField(
                                      label: "", content: ""),
                                ),
                                InputFieldPhone(label:"",content:"")




                              ]),
                        )),
                    Expanded(
                        flex: 10,
                        child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 45,
                                    left: 4.0,
                                    right: 4,
                                    bottom: 4),
                                child: InputField(
                                    label: "", content: "Adresse"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InputField(
                                    label: "",
                                    content: "Code Postal"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InputField(
                                    label: "", content: "Ville"),
                              ),
                              Column(
                                children: [

                                  Row(
                                    crossAxisAlignment : CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.all(
                                            4.0),
                                        child: DatePicker(
                                            content: "",
                                            label:
                                            "KBIS (Date d’expiration)"),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.all(
                                            4.0),
                                        child: UploadImageKBIS(label:"KBIS (Attachement)"),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InputField(
                                    label: "", content: "IBAN"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InputField(
                                    label: "", content: "BIC"),
                              ),
                            ]))
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 55, vertical: 8),
                          child: Text("Enregistrer",
                              style: kButtonStyle),
                        ),
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: kprimaryColor),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 8),
                          child:
                          Text("Cancel", style: kButtonStyle),
                        ),
                        style: TextButton.styleFrom(
                            primary: Colors.black,
                            backgroundColor: Color(0xFFe4e4e4)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}