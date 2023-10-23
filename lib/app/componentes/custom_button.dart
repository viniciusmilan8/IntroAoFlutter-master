import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function? callback;

  const CustomButton({
    super.key,
    required this.text,
    required this.fillColor,
    required this.textColor,
    required this.textSize,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 70,
        height: 70,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Color(fillColor),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          onPressed: () {
            callback!(text);
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              color: Color(textColor),
            ),
          ),
        ),
      ),
    );
  }
}

// const Color(0xFF8ac4d0),