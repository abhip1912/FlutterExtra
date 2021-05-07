import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onpress});
  final Widget cardChild;
  final Color colour;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.red,
        elevation: 7,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Container(
          decoration: BoxDecoration(
            color: colour, //Color(0xFF323244)
            borderRadius: BorderRadius.circular(15),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black87,
            //     blurRadius: 2.0,
            //     spreadRadius: 0.0,
            //     offset: Offset(2.0, 2.0), // shadow direction: bottom right
            //   )
            // ],
          ),
          padding: EdgeInsets.all(10),
          child: cardChild,
        ),
      ),
    );
  }
}
