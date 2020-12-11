import 'package:flutter/material.dart';
import 'reusable_card.dart';

class CustomExpandedCards extends StatelessWidget {
  CustomExpandedCards({
    this.cardContent_1,
    this.cardContent_2,
    this.detectorFunc_1,
    this.detectorFunc_2,
    this.color_1,
    this.color_2,
  });

  final Widget cardContent_1;
  final Widget cardContent_2;
  final Function detectorFunc_1;
  final Function detectorFunc_2;
  final Color color_1;
  final Color color_2;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: detectorFunc_1,
              child: ReusableCard(
                colour: color_1,
                childCard: cardContent_1,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: detectorFunc_2,
              child: ReusableCard(
                colour: color_2,
                childCard: cardContent_2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
