import 'dart:io';

import 'package:dashboard/constants/colors.dart';
import 'package:dashboard/constants/textStyles.dart';
import 'package:dashboard/provider/providercategory.dart';
import 'package:dashboard/widget/customAppBar.dart';

import 'package:dashboard/widget/menu_side.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'categories.dart';

import 'package:provider/provider.dart';

class AddCategories extends StatefulWidget {
  @override
  _AddCategoriesState createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  File image;
  final picker = ImagePicker();
  Future getImage(ImageSource src) async {
    final pickedFile = await picker.getImage(source: src);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print("no image selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
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
                  appBar: CustomAppBar("Médicaments > catégories"),
                  ///// body will change with widgets dynamiclly

                  body: ChangeNotifierProvider<MyProvider>(
                      create: (context) => MyProvider(),
                      child: Consumer<MyProvider>(
                          builder: (context, provider, child) {
                        return Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, top: 15.0, right: 15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 15),
                                    child: Row(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                PageRouteBuilder(
                                                  pageBuilder: (context,
                                                          animation1,
                                                          animation2) =>
                                                      Categories(),
                                                  transitionDuration:
                                                      Duration.zero,
                                                ));
                                          },
                                          child: Text("Liste des categories",
                                              style: TextStyle(
                                                  color: kprimaryColor,
                                                  fontFamily: "Montserrat",
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16)),
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Icon(Icons.add, color: kprimaryColor),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text("Ajouter une catégorie",
                                                style: TextStyle(
                                                    color: kGreyTitle,
                                                    fontFamily: "Montserrat",
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16))),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 150,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Name",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            3.7,
                                                    color: Colors.white,
                                                    child: TextField(
                                                      style: kNomralTextStyle,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.all(8.0),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFF21ba19),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0xFF21ba19),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        fillColor:
                                                            Color(0xFF21ba19),
                                                      ),
                                                      controller: myController,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 150,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Image",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 11.0),
                                                child: LayoutBuilder(
                                                  builder:
                                                      (BuildContext context,
                                                          BoxConstraints
                                                              constraints) {
                                                    return Column(
                                                      children: <Widget>[
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color:
                                                                        kprimaryColor,
                                                                    width: 1,
                                                                  ),
                                                                ),
                                                                height: 250,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    3.7,
                                                                child:
                                                                    TextButton(
                                                                        onPressed:
                                                                            () async {
                                                                          var image =
                                                                              await ImagePicker().getImage(source: ImageSource.gallery);
                                                                          provider
                                                                              .setImage(image);
                                                                        },
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(top: 90.0),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                            provider.image == null?  Icon(Icons.cloud_upload, size: 40): Text(""),
                                                                              Container(
                                                                                child: provider.image == null
                                                                                    ? Text("Déposer le fichier image ici",
                                                                                        style: TextStyle(
                                                                                          color: Colors.black26,
                                                                                          fontFamily: "Montserrat",
                                                                                          fontStyle: FontStyle.normal,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontSize: 12,
                                                                                        ))
                                                                                    : Container(width: 100,height:90,child: Image.network(provider.image.path,)),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ))),
                                                          ],
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 155.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    provider.setName(myController.text);
                                                    if (provider.image == null)
                                                      return;
                                                    provider.makePostRequest();
                                                    showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          AlertDialog(
                                                        title: const Text(
                                                            'Pharmadrive'),
                                                        content: provider
                                                                    .image ==
                                                                null
                                                            ? Text(
                                                                'Merci de remplir tous les champs')
                                                            : Text(
                                                                'la catégorie à été ajoutée '),
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
                                                                    context,
                                                                    'OK'),
                                                            child: const Text(
                                                                'OK'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                    child:
                                                    const Text('Show Dialog');
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 55,
                                                        vertical: 8),
                                                    child: Text("Enregistrer",
                                                        style: kButtonStyle),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                      primary: Colors.white,
                                                      backgroundColor:
                                                          kprimaryColor),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {},
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 25,
                                                        vertical: 8),
                                                    child: Text("Cancel",
                                                        style: kButtonStyle),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                      primary: Colors.black,
                                                      backgroundColor:
                                                          Color(0xFFe4e4e4)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ));
                      }))),
            )
          ],
        ),
      ),
    );
  }
}
