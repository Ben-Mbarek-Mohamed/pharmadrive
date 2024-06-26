import 'package:dashboard/pages/overview/widgets/info_card.dart';
import 'package:flutter/material.dart';


class OverviewCardsMediumScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   double _width = MediaQuery.of(context).size.width;

    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
                  children: [
                    InfoCard(
                      title: "Rides in progress",
                      value: "7",
                      onTap: () {},

                    ),
                    SizedBox(
                      width: _width / 64,
                    ),
                    InfoCard(
                      title: "Packages delivered",
                      value: "17",


                      onTap: () {},
                    ),
                  
                  ],
                ),
            SizedBox(
                      height: _width / 64,
                    ),
                  Row(
                  children: [
             
                    InfoCard(
                      title: "Cancelled delivery",
                      value: "3",

                      onTap: () {},
                    ),
                    SizedBox(
                      width: _width / 64,
                    ),
                    InfoCard(
                      title: "Scheduled deliveries",
                      value: "32",
                      onTap: () {},
                    ),
                
                  ],
                ),
      ],
    );
  }
}