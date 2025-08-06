import 'package:flutter/material.dart';
import 'package:peepo_oracle/assets/lists/oracle_phrases.dart' as oracle_responses;

class AnimatedImageContainer extends StatefulWidget {
  final String path = 'lib/assets';
  final String oracleResponse;
  final bool pressed;
  final Function(String, {bool zoomed}) onChangeImage;

  const AnimatedImageContainer({
    super.key,
    required this.oracleResponse,
    required this.pressed,
    required this.onChangeImage,
  });

  @override
  AnimatedImageContainerState createState() => AnimatedImageContainerState();
}

class AnimatedImageContainerState extends State<AnimatedImageContainer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late String currentImagePath;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    currentImagePath = "${widget.path}/img/sfera-iniziale.gif";
    //changeImage(widget.oracleResponse);
  }

  @override
  void didUpdateWidget(AnimatedImageContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.oracleResponse != oldWidget.oracleResponse) {
      changeImage(widget.oracleResponse, widget.onChangeImage);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeImage(String response, void Function(String, {bool zoomed}) onWordChanged) {
    String image;
    if (oracle_responses.OracleResponses.affirmativeResponses.contains(response)) {
      image = "${widget.path}/img/sfera-positiva.gif";
    } else if (oracle_responses.OracleResponses.negativeResponses.contains(response)) {
      image = "${widget.path}/img/sfera-negativa.gif";
    } else if (oracle_responses.OracleResponses.ambiguousResponses.contains(response)) {
      image = "${widget.path}/img/sfera-incognita.gif";
    } else if (oracle_responses.OracleResponses.ironicResponses.contains(response)) {
      image = "${widget.path}/img/sfera-ironica.gif";
    } else {
      image = "${widget.path}/img/sfera-iniziale.gif";
    }

    updateImage(image, onWordChanged);
  }

  void updateImage(String newImagePath, void Function(String, {bool zoomed}) onWordChanged) {
    if (newImagePath != currentImagePath) {
      setState(() {
        _opacity = 0.0; // Fai sparire l'immagine attuale
      });

      Future.delayed(const Duration(milliseconds: 1), () {
        setState(() {
          currentImagePath = newImagePath; // Cambia immagine
        });

        Future.delayed(const Duration(milliseconds: 0), () { // Breve ritardo per evitare glitch
          setState(() {
            _opacity = 1.0; // Rendi visibile la nuova immagine
          });
        });
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.02;

    return Positioned(
      bottom: 0,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: _opacity,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1500),
          curve: Curves.easeInOut,
          width: !widget.pressed ? fontSize * 50 : fontSize * 60,
          height: 300,
          decoration: BoxDecoration(color: Colors.transparent),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(currentImagePath, fit: BoxFit.cover),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
