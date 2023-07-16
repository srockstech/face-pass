import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  ReusableCard({@required this.colour, this.cardChild, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 1000,
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
        child: cardChild,
        margin: EdgeInsets.only(top: 30, left: 30, right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white, width: 2),
          color: colour,
        ),
      ),
    );
  }
}
