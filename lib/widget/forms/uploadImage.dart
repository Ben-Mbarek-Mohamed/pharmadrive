import 'dart:io';

import 'package:dashboard/constants/colors.dart';
import 'package:dashboard/constants/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState()=> _UploadImageState();

}
class _UploadImageState extends State<UploadImage>{
    File image;
  var picker = ImagePicker();
  Future getImage(ImageSource src) async {
    final pickedFile = await ImagePicker().pickImage(source: src) ;
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
    return Padding(
      padding: const EdgeInsets.only(top:11.0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kprimaryColor,
                          width: 1,
                        ),
                      ),
                      height: 250,
                      width: MediaQuery.of(context).size.width / 3.7,
                      child: TextButton(
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 90.0),
                            child: Column(
                              children: [
                                Icon(Icons.cloud_upload, size: 40),
                                Container(
                                  child: image==null ? Text("Déposer le fichier image ici",
                                      style: TextStyle(
                                        color: Colors.black26,
                                        fontFamily: "Montserrat",
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      )) :Image.file(image),
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
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }


}
