import 'dart:io';

import 'package:dashboard/constants/colors.dart';
import 'package:dashboard/constants/textStyles.dart';
import 'package:dashboard/pages/LoginRegister/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dashboard/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerRep = new TextEditingController();
  TextEditingController controllerPhone = new TextEditingController();
  TextEditingController controllerAdresse = new TextEditingController();

  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var isLoading = false;


    Future<http.Response> signin() {
      setState(() {
        isLoading = true;
      });
      return http.post(
        Uri.parse('http://localhost:8089/v1/new/pharmacie'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': controllerName.text,
          'representant': controllerRep.text,
          'phone': controllerPhone.text,
          'adresse': controllerAdresse.text,
          'email': controllerEmail.text,
          'password': controllerPass.text,
        }),
      );
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: (size.width>1000)?Row(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              height: 750,
              margin: EdgeInsets.only(top: 50, left: 25, bottom: 10),
              color: Colors.white,
              constraints: BoxConstraints(maxWidth: 550, maxHeight: 550),
              padding: EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                        ),
                        Container(
                          child: Image.asset(
                            "assets/images/logo.png",
                            height: 120,
                            width: 120,
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Nom de pharmacie",
                        focusColor: kprimaryColor,
                        labelStyle: TextStyle(color: kprimaryColor),
                        hintText: "Nom de pharmacie",
                      ),
                      controller: controllerName,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          labelText: "Nom de répresentant",
                          focusColor: kprimaryColor,
                          labelStyle: TextStyle(color: kprimaryColor),
                          hintText: "Nom de répresentant",
                        ),
                        controller: controllerRep),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          labelText: "Téléphone",
                          focusColor: kprimaryColor,
                          labelStyle: TextStyle(color: kprimaryColor),
                          hintText: "",
                        ),
                        controller: controllerPhone),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          labelText: "Adresse",
                          focusColor: kprimaryColor,
                          labelStyle: TextStyle(color: kprimaryColor),
                          hintText: "",
                        ),
                        controller: controllerAdresse),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          focusColor: kprimaryColor,
                          labelStyle: TextStyle(color: kprimaryColor),
                          hintText: "abc@domain.com",
                        ),
                        controller: controllerEmail),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Mot de passe ",
                          labelStyle: TextStyle(color: kprimaryColor),
                          hintText: "123",
                        ),
                        controller: controllerPass),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        signin();
                        Fluttertoast.showToast(
                            msg: 'Your account has been created successfully',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.yellow);

                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                Auth(),
                            transitionDuration: Duration.zero,
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: kprimaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: isLoading
                            ? CircularProgressIndicator()
                            : Text("S'inscrire",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Montserrat",
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                )),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 200.0),
                        child: Row(
                          children: [
                            Text("Déjà un compte ?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                              Auth(),
                                      transitionDuration: Duration.zero,
                                    ),
                                  );
                                },
                                child: Text("Connexion ",
                                    style: TextStyle(color: kprimaryColor)))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              height: 750,
              margin: EdgeInsets.only(top: 50, right: 25, bottom: 10),
              color: kprimaryColor,
              constraints: BoxConstraints(maxWidth: 550, maxHeight: 550),
              padding: EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Rejoignez notre communauté",
                          style: kMeduim1TextStyle),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //SizedBox(width: 200,),
                        Center(
                          child: Container(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 48.0),
                            child: Image(
                              image: AssetImage(
                                "../../../assets/images/bgpharmdrive.png",
                              ),
                            ),
                          )),
                        ),
                        // Expanded(child: Container()),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(
                          """Voilà une application qui s'adresse à la fois aux malades et aux personnes en bonne
santé. À l’origine du projet, des médecins et  des spécialistes de la santé qui se sont unis..
Voilà une application qui s'adresse à la fois aux malades et aux personnes .""",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ):ListView(
        children: [
           Container(
              height: 700,
              margin: EdgeInsets.only(top: 30, left: 5, bottom: 10),
              color: Colors.white,
              constraints: BoxConstraints(maxWidth: 550, maxHeight: 800),
              padding: EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                        ),
                        Container(
                          child: Image.asset(
                            "assets/images/logo.png",
                            height: 120,
                            width: 120,
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Nom de pharmacie",
                        focusColor: kprimaryColor,
                        labelStyle: TextStyle(color: kprimaryColor),
                        hintText: "Nom de pharmacie",
                      ),
                      controller: controllerName,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          labelText: "Nom de répresentant",
                          focusColor: kprimaryColor,
                          labelStyle: TextStyle(color: kprimaryColor),
                          hintText: "Nom de répresentant",
                        ),
                        controller: controllerRep),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          labelText: "Téléphone",
                          focusColor: kprimaryColor,
                          labelStyle: TextStyle(color: kprimaryColor),
                          hintText: "",
                        ),
                        controller: controllerPhone),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          labelText: "Adresse",
                          focusColor: kprimaryColor,
                          labelStyle: TextStyle(color: kprimaryColor),
                          hintText: "",
                        ),
                        controller: controllerAdresse),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          focusColor: kprimaryColor,
                          labelStyle: TextStyle(color: kprimaryColor),
                          hintText: "abc@domain.com",
                        ),
                        controller: controllerEmail),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Mot de passe ",
                          labelStyle: TextStyle(color: kprimaryColor),
                          hintText: "123",
                        ),
                        controller: controllerPass),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        signin();
                        Fluttertoast.showToast(
                            msg: 'Your account has been created successfully',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.yellow);

                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                Auth(),
                            transitionDuration: Duration.zero,
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: kprimaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: isLoading
                            ? CircularProgressIndicator()
                            : Text("S'inscrire",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Montserrat",
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 200.0),
                        child: Row(
                          children: [
                            Text("Déjà un compte ?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (context, animation1, animation2) =>
                                          Auth(),
                                      transitionDuration: Duration.zero,
                                    ),
                                  );
                                },
                                child: Text("Connexion ",
                                    style: TextStyle(color: kprimaryColor)))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

           Container(
              height: 750,
              margin: EdgeInsets.only(top: 10, right: 5, bottom: 10),
              color: kprimaryColor,
              constraints: BoxConstraints(maxWidth: 550, maxHeight: 550),
              padding: EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Rejoignez notre communauté",
                          style: kMeduim1TextStyle),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //SizedBox(width: 200,),
                        Center(
                          child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 48.0),
                                child: Image(
                                  image: AssetImage(
                                    "../../../assets/images/bgpharmdrive.png",
                                  ),
                                ),
                              )),
                        ),
                        // Expanded(child: Container()),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(
                          """Voilà une application qui s'adresse à la fois aux malades et aux personnes en bonne
santé. À l’origine du projet, des médecins et  des spécialistes de la santé qui se sont unis..
Voilà une application qui s'adresse à la fois aux malades et aux personnes .""",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
            ),

        ],
      ),
    );
  }
}
