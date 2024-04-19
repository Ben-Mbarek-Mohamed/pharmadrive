import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
  ));
}

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passVis = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: (size.width > 1200)
          ? Row(
              children: [
                LoginForm(size: size),
                backGroundImage(size),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  LoginForm(size: size),
                  backGroundImage(size),
                ],
              ),
            ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final Size size;

  LoginForm({@required this.size});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool passVis = true;
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    Size size = widget.size;
    return Container(
      width: (size.width > 1200) ? size.width * 0.5 : size.width,
      height: (size.width > 1200) ? size.height : 700,
      child: Padding(
        padding: EdgeInsets.only(top: 30, left: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(
                "assets/images/logo.png",
                height: 90,
                width: 90,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Login to access your Pharmadrive account',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w100,
                    color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 120),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'abc@gmail.com',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'abc@gmail.com',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
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
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        fixedSize: Size(size.width, 50),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("vous n'avez pas de compte ?"),
                        TextButton(
                            onPressed: () {},
                            child: Text("S'inscrire! ",
                                style: TextStyle(color: Colors.redAccent)))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget backGroundImage(Size size) {
  return Container(
    width: (size.width > 1200) ? size.width * 0.5 : size.width,
    height: (size.width > 1200) ? size.height : 700,
    child: Padding(
      padding: (size.width > 1200)
          ? EdgeInsets.only(right: 150, top: 20, bottom: 40, left: 20)
          : EdgeInsets.only(right: 30, top: 0, bottom: 40, left: 30),
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage(
          "../../../assets/images/par1.png",
        ),
      ),
    ),
  );
}
