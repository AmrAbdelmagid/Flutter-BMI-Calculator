import 'file:///C:/Users/Amr%20Abdelmagid/bmi_calculator/lib/components/down_card_content.dart';
import 'file:///C:/Users/Amr%20Abdelmagid/bmi_calculator/lib/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/upper_card_content.dart';
import '../components/custom_expanded.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomExpandedCards(
              detectorFunc_1: () {
                setState(() {
                  selectedGender = Gender.male;
                });
              },
              detectorFunc_2: () {
                setState(() {
                  selectedGender = Gender.female;
                });
              },
              color_1: selectedGender == Gender.male
                  ? kActiveReusableCardColor
                  : kInactiveReusableCardColor,
              color_2: selectedGender == Gender.female
                  ? kActiveReusableCardColor
                  : kInactiveReusableCardColor,
              cardContent_1: UpperCardContent(
                cardIconData: FontAwesomeIcons.mars,
                cardText: 'MALE',
              ),
              cardContent_2: UpperCardContent(
                cardIconData: FontAwesomeIcons.venus,
                cardText: 'FEMALE',
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveReusableCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kCardContentTextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toString(),
                          style: kPersonHeightTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kCardContentTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x29EB1555),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomExpandedCards(
              color_1: kActiveReusableCardColor,
              color_2: kActiveReusableCardColor,
              cardContent_1: DownCardContent(
                indicator: 1,
                weight: weight,
                onPressedPlus: () {
                  setState(() {
                    weight++;
                  });
                },
                onPressedMinus: () {
                  setState(() {
                    weight--;
                  });
                },
                label: 'WEIGHT',
              ),
              cardContent_2: DownCardContent(
                indicator: 2,
                age: age,
                label: 'AGE',
                onPressedPlus: () {
                  setState(() {
                    age++;
                  });
                },
                onPressedMinus: () {
                  setState(() {
                    age--;
                  });
                },
              ),
            ),
            BottomButton(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ResultsPage(
                              bmi: calc.calculateBMI(),
                              result: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
              childText: 'CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}