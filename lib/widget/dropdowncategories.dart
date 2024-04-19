import 'package:flutter/material.dart';

import '../constants/textStyles.dart';

class Item {
  const Item(this.name);
  final String name;
}

class DropdownScreenCategories extends StatefulWidget {
  State createState() => DropdownScreenCategoriesState();
}

class DropdownScreenCategoriesState extends State<DropdownScreenCategories> {
   getCategory(){
    return selectedUser.name;
  }
  Item selectedUser;
  List<Item> users = <Item>[
    const Item(
      'Beaute',
    ),
    const Item(
      'Sante',
    ),
    const Item(
      'Maquillage',
    ),
  ]; //SNC, SCP, Cooperative
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF21ba19),
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3.75,
            child: DropdownButton<Item>(
              hint: Text(
                "Categories",
                style: kNomralTextStyle,
              ),
              underline: Text(""),
              value: selectedUser,
              onChanged: (Item Value) {
                setState(() {
                  selectedUser = Value;
                });
              },
              items: users.map((Item user) {
                return DropdownMenuItem<Item>(
                  value: user,
                  child: Row(
                    children: <Widget>[
                      Text(
                        user.name,
                        style: kMeduimTextStyle,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      );
    });
  }
}
