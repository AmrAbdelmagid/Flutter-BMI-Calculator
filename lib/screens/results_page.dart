import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../constants.dart';
import '../components/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.result,@required this.bmi,@required this.interpretation});

  final String result;
  final String bmi;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text(
                'Your Result',
                style: kTitleResultStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveReusableCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmi,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(onTap: () {
            Navigator.pop(context);
          }, childText: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
