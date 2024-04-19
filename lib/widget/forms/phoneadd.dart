import 'package:dashboard/constants/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
class InputFieldPhone extends StatelessWidget {
  final String label;
  final String content;
  final TextEditingController myController ; 

  InputFieldPhone({this.label, this.content,this.myController});

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
                      width: MediaQuery.of(context).size.width /3.59,
                      decoration: BoxDecoration(
                            
                              border: Border.all(
                               color:Color(0xFF21ba19),
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                           
                      
                          ),
                     child: Row(
                       children: [
                          Container(
                            
              width: MediaQuery.of(context).size.width/8,
              child: CountryCodePicker(
                                                          onChanged: (e) =>
                                                              print(e.toLongString()),
                                                          initialSelection: 'TF',
                                                          showOnlyCountryWhenClosed:
                                                              false,
                                                          hideSearch: false,
                                                          showFlagMain: true,
                                                          alignLeft: true,
                                                          favorite: ['+39', 'FR'],
                                                        ),
            ),
                         Container(
              width: MediaQuery.of(context).size.width / 7.5,
            
            
              child: TextField(
                          style:kNomralTextStyle,
                          
                          controller: myController,
              ),
            ),
                       ],
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
