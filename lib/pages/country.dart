import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class MyAppCountry extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyAppCountry> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('CountryPicker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
         
           
            SizedBox(
              width: 400,
              height: 60,
              child: CountryCodePicker(
                onChanged: print,
                hideMainText: true,
                showFlagMain: true,
                showFlag: true,
                initialSelection: 'TF',
                hideSearch: false,
                showCountryOnly: true,
                showOnlyCountryWhenClosed: true,
                alignLeft: true,
              ),
            ),
            
           
            
          ],
        ),
      ),
    );
  }
}
/*import 'package:dashboard/pages/LoginRegister/auth.dart';
import 'package:dashboard/pages/country.dart';
import 'package:dashboard/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
   getData() async {
      SharedPreferences _pref = await SharedPreferences.getInstance();

      _pref.containsKey("rep");
    }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "tableau de board",
      debugShowCheckedModeBanner: false,
      home: MyAppCountry(),
    );
  }
}









 SizedBox(
                width: 400,
                height: 60,
                child: CountryCodePicker(
                  onChanged: (e) => print(e.toLongString()),
                  initialSelection: 'TF',
                  
                  showOnlyCountryWhenClosed: false,
              
                   hideSearch: false,
                                     showFlagMain: true,
                                     alignLeft: true,
                  favorite: ['+39', 'FR'],
                ),
              ),
*/