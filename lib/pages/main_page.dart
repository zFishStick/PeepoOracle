import 'package:flutter/material.dart';
import 'package:peepo_oracle/assets/theme/my_colors.dart' as my_colors;
import 'package:peepo_oracle/components/spin_button.dart';
import 'package:peepo_oracle/components/animated_image.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  String choosenWord = "Vediamo cos'ha in serbo l'oracolo"; // Stato iniziale
  String imgPath = 'lib/assets/img/sfera-iniziale.gif';
  bool zoomed = false;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.02;
    double height = MediaQuery.of(context).size.height * 0.8;

    return Scaffold(
      body: Stack(
        children: [
          my_colors.GradientBackground(),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.all(10.0),
                    height: height,
                    decoration: BoxDecoration(
                      color: my_colors.AppColors.cardColor,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: my_colors.AppColors.borderColor,
                        width: 10.0,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center, // Allinea tutto al centro
                      children: [
                        Positioned(
                          top: 0,
                          left: 5.0,
                          right: 5.0,
                          child: Container(
                            decoration: BoxDecoration(color: Colors.transparent),
                            height: height * 0.6,
                            child: Align(
                              alignment: Alignment(0, -0.5),
                              child: AnimatedDefaultTextStyle(
                                style: TextStyle(
                                  color: my_colors.AppColors.textColor,
                                  fontFamily: 'New Era Casual',
                                  fontSize: zoomed ? fontSize * 6.5 : fontSize * 6,
                                ),
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                child: Text(
                                  choosenWord,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedImageContainer(
                          oracleResponse: choosenWord,
                          pressed: zoomed,
                          onChangeImage: (String newImagePath, {bool zoomed = false}) {
                            setState(() {
                              imgPath = newImagePath; // Aggiorna l'immagine
                              this.zoomed = zoomed;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SpinButton(
                    onPressed: () {
                      setState(() {
                        pressed = true;
                      });
                    },
                    label: "Tenta la sorte",
                    onWordChanged: (newWord, {bool zoomed = false}) {
                      setState(() {
                        choosenWord = newWord;
                        this.zoomed = zoomed;
                        if (this.zoomed) {
                          pressed = false;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
