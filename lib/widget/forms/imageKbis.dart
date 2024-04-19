import 'dart:io';

import 'package:dashboard/constants/colors.dart';
import 'package:dashboard/constants/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageKBIS extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
  final String label;
  

  UploadImageKBIS({this.label });
}

class _UploadImageState extends State<UploadImageKBIS> {
  File image;
  var picker = ImagePicker();
  Future getImage(ImageSource src) async {
    final pickedFile = await ImagePicker().pickImage(source: src);
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
      padding: const EdgeInsets.only(top: 11.0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: <Widget>[
              
              Column(
                
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.label}",
                   textAlign: TextAlign.left,
                   style: TextStyle(
                       color: Color(0xFF3F4B57),
                       fontFamily: "Montserrat",
                       fontStyle: FontStyle.normal,
                       fontWeight: FontWeight.w500,
                       fontSize: 12)),
                      Container(
                        width: 150,
                      // width: MediaQuery.of(context).size.width /7 ,
                  height: 40 ,
                     decoration: BoxDecoration(
                       border: Border.all(
                         color: kprimaryColor,
                         width: 1,
                       ),
                        borderRadius:BorderRadius.circular(5.0)
                     ),
                    
                     child: TextButton(
                         onPressed: () {
                           getImage(ImageSource.gallery);
                         },
                         child: Row(
                           children: [
                             Icon(Icons.folder,color: kprimaryColor, ),
                             SizedBox(width: 15,),
                             Container(
                               child: image == null
                                   ? Text("Parrcourir",
                                       style: TextStyle(
                                         color: Colors.black26,
                                         fontFamily: "Montserrat",
                                         fontStyle: FontStyle.normal,
                                         fontWeight: FontWeight.w500,
                                         fontSize: 12,
                                       ))
                                   : Text("fichier sélectionné", style :  TextStyle(
    color: Color(0xFF3F4B57),
    fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 12)),
                             ),
                           ],
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
