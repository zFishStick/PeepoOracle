import 'package:flutter/material.dart';
import 'package:peepo_oracle/assets/theme/my_colors.dart' as my_colors;
import 'package:peepo_oracle/assets/lists/oracle_phrases.dart' as oracle_responses;
import 'dart:async';
import 'dart:math';

class SpinButton extends StatefulWidget {
  final String label;
  final Function(String, {bool zoomed}) onWordChanged;
  final Function()? onPressed;

  const SpinButton({
    super.key,
    required this.label,
    required this.onWordChanged,
    required this.onPressed
  });

  @override
  SpinButtonState createState() => SpinButtonState();
}

class SpinButtonState extends State<SpinButton> {
  bool isButtonDisabled = false;

  void chooseWord(
    void Function(String, {bool zoomed}) onWordChanged
  ) {
    final random = Random();
    int finalIndex = random.nextInt(
      oracle_responses.OracleResponses.getAllResponses().length,
    );
    int step = 200;
    int iteration = 0;

    void updateResponse() {
      String response = oracle_responses.OracleResponses.getRandomResponse();
      onWordChanged(response);

      iteration++;
      if (iteration > 10) {
        step = (step * 1.1).toInt();
      }
      if (iteration > 20) {
        Timer(Duration(milliseconds: step), () {
          String finalResponse = oracle_responses.OracleResponses.getAllResponses()[finalIndex];
          onWordChanged(
            finalResponse,
            zoomed: true
          );

          Timer(const Duration(seconds: 2), () {
            setState(() {
              isButtonDisabled = false; // Riabilita il pulsante
            });
          });
        });
      } else {
        Timer(Duration(milliseconds: step), updateResponse);
      }
    }

    updateResponse();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.02;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: ElevatedButton(
        onPressed: isButtonDisabled? null
                : () {
                  chooseWord(widget.onWordChanged);
                  setState(() {
                    isButtonDisabled = true;
                  });
                  if (widget.onPressed != null) {
                    widget.onPressed!();
                  }
                },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: my_colors.AppColors.cardColor,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          textStyle: TextStyle(
            fontSize: fontSize * 5,
            fontFamily: 'Chewy',
            letterSpacing: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color:
                  !isButtonDisabled
                      ? my_colors.AppColors.borderColor
                      : my_colors.AppColors.disabledButtonColor,
              width: 5.0,
            ),
          ),
        ),
        child: Text(widget.label),
      ),
    );
  }
}
