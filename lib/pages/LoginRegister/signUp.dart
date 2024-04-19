import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SignUp(),
    debugShowCheckedModeBanner: false,
  ));
}

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool passVis = true;
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: (size.width > 1200)
          ? Row(
              children: [
                backGroundImage(size),
                SignUpForm(),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SignUpForm(),
                  backGroundImage(size),
                ],
              ),
            ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool passVis = true;
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: (size.width > 1200) ? size.width * 0.5 : size.width,
      height: (size.width > 1200) ? size.height : 700,
      child: Padding(
        padding: EdgeInsets.only(top: 30, left: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.3),
              child: Container(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 90,
                  width: 90,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Let\'s get you all set up so you can access your personal account.' ,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w100,
                    color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 120),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: (size.width > 1200) ? size.width * 0.15 + 15 : size.width * 0.3,
                          child: TextFormField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              border: OutlineInputBorder(),
                              labelText: 'Nom de Pharmacie',
                              hintText: 'abc@gmail.com',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: (size.width > 1200) ? size.width * 0.15 + 15 : size.width * 0.3,
                          child: TextFormField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              border: OutlineInputBorder(),
                              labelText: 'Nom de Representant',
                              hintText: 'abc@gmail.com',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: (size.width > 1200) ? size.width * 0.15 + 15: size.width * 0.3,
                          child: TextFormField(
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
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: (size.width > 1200) ? size.width * 0.15 + 15 : size.width * 0.3,
                          child: TextFormField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              border: OutlineInputBorder(),
                              labelText: 'N° Telephone',
                              hintText: 'abc@gmail.com',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: (size.width > 1200) ? size.width * 0.3 + 50 : size.width * 0.6 + 20,
                      child: TextFormField(
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
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: (size.width > 1200) ? size.width * 0.3 + 50 : size.width * 0.6 + 20,
                      child: TextFormField(
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
                          labelText: 'Confirm Password',
                          hintText: 'abc@gmail.com',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(

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
                            Text("I agree to all "),
                          ],
                        ),
                        Text(
                          "Terms ",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        Text("and "),
                        Text(
                          "Privacy Policies ",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: (size.width > 1200) ? size.width * 0.3 + 50 : size.width * 0.6 + 20,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Create account'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          fixedSize: Size(size.width, 50),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have account ?"),
                        TextButton(
                            onPressed: () {},
                            child: Text("Login ",
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
    width: (size.width > 1000) ? size.width * 0.5 : size.width,
    height: (size.width > 1000) ? size.height : 700,
    child: Padding(
      padding: (size.width > 1000)
          ? EdgeInsets.only(right: 10, top: 20, bottom: 40, left: 20)
          : EdgeInsets.only(right: 30, top: 0, bottom: 40, left: 30),
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage(
          "../../../assets/images/par2.png",
        ),
      ),
    ),
  );
}
