import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.childText});

  final Function onTap;
  final String childText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(childText,style: kBottomButtonTextStyle,)),
        color: kBottomContainerCardColor,
        margin: const EdgeInsets.only(top: 10.0),
        //padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
