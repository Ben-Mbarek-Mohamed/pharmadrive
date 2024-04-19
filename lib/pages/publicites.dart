import 'package:dashboard/constants/textStyles.dart';
import 'package:dashboard/widget/customAppBar.dart';
import 'package:dashboard/widget/menu_side.dart';
import 'package:flutter/material.dart';
class Pubs extends StatelessWidget {
  const Pubs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                appBar: CustomAppBar("Publicités"),
                ///// body will change with widgets dynamiclly

                body: Column(
                  children: [
                     SizedBox(height:5),
                    Text("Publicités"),
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}