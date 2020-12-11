import 'package:flutter/material.dart';
import '../constants.dart';

class UpperCardContent extends StatelessWidget {
  UpperCardContent({@required this.cardIconData, @required this.cardText});

  final IconData cardIconData;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIconData,
          size: kUpperCardIconSize,
        ),
        SizedBox(
          height: kUpperCardSizedBoxHeight,
        ),
        Text(
          cardText,
          style: kCardContentTextStyle,
        ),
      ],
    );
  }
}
