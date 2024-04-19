import 'package:dashboard/constants/style.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final bool isActive;
  final Function onTap;
  final Color color;
  final IconData iconData;

  const InfoCard(
      {Key key,
      @required this.title,
      @required this.value,
      this.isActive = false,
      @required this.onTap,
      @required this.color,
        @required this.iconData
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 330,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 15,
              ),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(iconData,size: 50,color: Colors.white,),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                    Text(
                      'Total: ' + value.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.w100, fontSize: 15,color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Icon(
                Icons.navigate_next_sharp,
                size: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
// @override
// Widget build(BuildContext context) {
//   return InkWell(
//     onTap: onTap,
//     child: Container(
//       height: 136,
//       width: widh * 0.22,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//               offset: Offset(0, 1),
//               color: lightGrey.withOpacity(.1),
//               blurRadius: 1)
//         ],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         children: [
//           Container(
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: Colors.grey
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: RichText(
//                 textAlign: TextAlign.start,
//                 text: TextSpan(children: [
//                   TextSpan(
//                       text: "$title\n",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                           color: Colors.white)),
//                   TextSpan(
//                     text: "$value",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 40,
//                         color: Colors.white),
//                   ),
//                 ]),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
}
