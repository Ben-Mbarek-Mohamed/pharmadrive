import 'package:dashboard/constants/textStyles.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String content;
  final TextEditingController myController ; 

  InputField({this.label, this.content,this.myController});

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
                  style:kMeduimTextStyle
              ),
               
               Container(
              width: MediaQuery.of(context).size.width / 3.7,
              color: Colors.white,
              child: TextField(
                style:kNomralTextStyle,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
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
                controller: myController,
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
