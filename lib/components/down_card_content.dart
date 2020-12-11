import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class DownCardContent extends StatefulWidget {
  DownCardContent({
    @required this.onPressedPlus,
    @required this.onPressedMinus,
    @required this.label,
    @required this.indicator,
    this.weight,
    this.age,
  });

  final Function onPressedPlus;
  final Function onPressedMinus;
  final int weight;
  final String label;
  final int age;

  // this indicator is to determine which attribute (age or weight) should be shown on the card
  final int indicator;

  @override
  _DownCardContentState createState() => _DownCardContentState();
}

class _DownCardContentState extends State<DownCardContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.label,
          style: kCardContentTextStyle,
        ),
        Text(
          (widget.indicator == 1)
              ? widget.weight.toString()
              : widget.age.toString(),
          style: kPersonHeightTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              iconData: FontAwesomeIcons.plus,
              onPressed: widget.onPressedPlus,
            ),
            SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              iconData: FontAwesomeIcons.minus,
              onPressed: widget.onPressedMinus,
            ),
          ],
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.iconData, this.onPressed});

  final IconData iconData;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      onPressed: onPressed,
      child: Icon(iconData),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
