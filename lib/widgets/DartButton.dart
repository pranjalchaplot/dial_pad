import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialButton extends StatelessWidget {
  final String text, letters;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;

  const DialButton({
    Key key,
    this.text,
    this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize = 25,
    this.callback,
    this.letters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 80,
        height: 70,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            color: Colors.blue,
            child: TextButton(
              onPressed: () {
                callback(text);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: textSize,
                        color: Color(textColor),
                      ),
                    ),
                  ),
                  Text(
                    letters,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        color: Color(textColor),
                        fontSize: textSize * 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
