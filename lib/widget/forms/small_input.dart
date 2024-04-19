import 'package:dashboard/constants/textStyles.dart';
import 'package:flutter/material.dart';

class InputFieldS extends StatelessWidget {
  final String label;
  final String content;

  InputFieldS({this.label, this.content});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: <Widget>[
            Column(
              crossAxisAlignment:CrossAxisAlignment.start,
             children: [
                Text(
                  "$label",
                  textAlign: TextAlign.left,
                  style :  TextStyle(
    color: Color(0xFF3F4B57),
    fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 12)
              ),
               
               Container(
              width: MediaQuery.of(context).size.width /7.5 ,
              height: 40 ,
              color: Colors.white,
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:Color(0xFF21ba19),
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                     color:Color(0xFF21ba19),
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "$content",
                  fillColor: Color(0xFF21ba19),
                ),
              ),
            ),
             ],
             
            ),
          
           
          ],
        );
      },
    );
  }
}
