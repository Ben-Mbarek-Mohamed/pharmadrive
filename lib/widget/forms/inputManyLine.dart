import 'package:dashboard/constants/textStyles.dart';
import 'package:flutter/material.dart';

class InputManyLine extends StatelessWidget {
  final String label;
  final String content;

  InputManyLine({this.label, this.content});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: <Widget>[
            Row(
              crossAxisAlignment:CrossAxisAlignment.start,
             children: [
                Container(
                   height: 50,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text(
                      "$label",
                      
                      style:TextStyle(
    
    fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
     fontSize: 16,
     
     
  )
              ),
                  ),
                ),
               
               Container(
              width: MediaQuery.of(context).size.width / 3.7,
             
              color: Colors.white,
              child: TextField(
                style:kNomralTextStyle,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    
                    borderSide: BorderSide(
                      
                      color:Color(0xFF21ba19),
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  
                  
              
                    
                               
                   hintText: "$content", 
                  contentPadding: EdgeInsets.only(top:137,bottom: 90),
                  
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                     color:Color(0xFF21ba19),
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  
                 
                  
                  fillColor: Color(0xFF21ba19),
                  hintStyle:TextStyle(
    
    fontFamily: "Montserrat",
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
     fontSize: 12,
     
     
  ) 
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
