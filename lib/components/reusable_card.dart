import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.childCard});

  final Color colour;
  final Widget childCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childCard,
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
