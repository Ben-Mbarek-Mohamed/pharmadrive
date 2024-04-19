import 'dart:convert';
import 'dart:html';

import 'package:dashboard/api/models/user.dart';
import 'package:dashboard/constants/colors.dart';
import 'package:dashboard/constants/textStyles.dart';
import 'package:dashboard/pages/LoginRegister/register.dart';
import 'package:dashboard/pages/homePage.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class Auth extends StatefulWidget {
  const Auth({Key key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool ischecked = false;
  TextEditingController mailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  showMyDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pharmadrive'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text("Email or password are incorrect"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Retry'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool passVis = true;
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");

  String url = "http://localhost:8089/v1/login";
  bool acc = false;
  bool isLoading = false;
  String id = "123";

  Future save() async {
    setState(() {
      isLoading = true;
    });
    try {
      var res = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'email': user.email, 'password': user.password}));
      print("////////////////");
      // get id pharmcie
      Map parsed = json.decode(res.body);
      print(parsed.entries.first.value);
      setState(() {
        id = parsed.entries.first.value;
      });
      print(res.statusCode);
      print("------------------");
      if (res.statusCode == 200) {
        //savePref(user.email);
        setState(() {
          acc = true;
        });
        if(ischecked){
          setIdPharmacie();
        }
        await Future.delayed(Duration(seconds: 4));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      } else {
        showMyDialog();
        setState(() {
          acc = false;
          isLoading = false;
        });
      }
    } catch (e) {
      {
        showMyDialog();

        setState(() {
          acc = false;
          isLoading = false;
        });
      }
    }
  }

//store the id of pharmacy in local storage browser
  setIdPharmacie() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString("id", id);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: (size.width>1000)?Row(
        children: [
          Expanded(
            flex: 10,
            child: Form(
              key: _formKey,
              child: Container(
                height: 750,
                margin: EdgeInsets.only(top: 50, left: 25, bottom: 10),
                color: Colors.white,
                constraints: BoxConstraints(maxWidth: 550, maxHeight: 550),
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        focusColor: kprimaryColor,
                        labelStyle: TextStyle(color: kprimaryColor),
                        hintText: "abc@domain.com",
                      ),
                      // controller: TextEditingController(text: user.email),
                      controller: mailController,
                      onChanged: (val) {
                        user.email = val;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Email is Empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: passVis,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passVis = !passVis;
                              });
                            },
                            icon: Icon((passVis)
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        labelText: "Password",
                        labelStyle: TextStyle(color: kprimaryColor),
                        hintText: "Password",
                      ),
                      // controller: TextEditingController(text: user.password),
                      controller: passController,
                      onChanged: (val) {
                        user.password = val;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password is Empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: ischecked,
                                checkColor: kprimaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    ischecked = value;
                                  });
                                }),
                            Text("Remeber Me"),
                          ],
                        ),
                        Text(
                          "Forgot password?",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          save();
                        }
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
                            : Text("Se connecter",
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
                    Padding(
                      padding: const EdgeInsets.only(left: 180.0),
                      child: Row(
                        children: [
                          Text("vous n'avez pas de compte ?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            Register(),
                                    transitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              child: Text("S'inscrire! ",
                                  style: TextStyle(color: kprimaryColor)))
                        ],
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
           Form(
              key: _formKey,
              child: Container(
                height: 750,
                margin: EdgeInsets.only(top: 30, left: 5, bottom: 10),
                color: Colors.white,
                constraints: BoxConstraints(maxWidth: 550, maxHeight: 550),
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        focusColor: kprimaryColor,
                        labelStyle: TextStyle(color: kprimaryColor),
                        hintText: "abc@domain.com",
                      ),
                      controller: TextEditingController(text: user.email),
                      onChanged: (val) {
                        user.email = val;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Email is Empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      obscureText: passVis,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passVis = !passVis;
                              });
                            },
                            icon: Icon((passVis)
                                ? Icons.visibility_off
                                : Icons.visibility)),
                        labelText: "Password",
                        labelStyle: TextStyle(color: kprimaryColor),
                        hintText: "Password",
                      ),
                      controller: TextEditingController(text: user.password),
                      onChanged: (val) {
                        user.password = val;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password is Empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                              Checkbox(
                                  value: ischecked,
                                  checkColor: kprimaryColor,
                                  onChanged: (value) {
                                      setState(() {
                                        ischecked = value;
                                      });
                                }),
                            Text("Remeber Me"),
                          ],
                        ),
                        Text(
                          "Forgot password?",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          save();
                        }
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
                            : Text("Se connecter",
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
                    Padding(
                      padding: const EdgeInsets.only(left: 180.0),
                      child: Row(
                        children: [
                          Text("vous n'avez pas de compte ?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                        Register(),
                                    transitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              child: Text("S'inscrire! ",
                                  style: TextStyle(color: kprimaryColor)
                              ),
                          ),
                        ],
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
