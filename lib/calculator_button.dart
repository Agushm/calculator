import 'package:flutter/material.dart';
import 'package:kalkulator/theme.dart';

typedef void CalculatorButtonTapCallback({String buttonText});

class CalculatorButton extends StatelessWidget {
  CalculatorButton({this.text, @required this.onTap});

  final String text;
  final CalculatorButtonTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.all(5),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(360),
            //   color: greyBtn,
            //   border: Border.all(
            //     color: greyBtn,
            //     width: 0.5,
            //   ),
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.grey.withOpacity(0.5),
            //       spreadRadius: 5,
            //       blurRadius: 7,
            //       offset: Offset(0, 3), // changes position of shadow
            //     ),
            //   ],
            //),
            child: RaisedButton(
              elevation: 6,
              color: btnColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () => onTap(buttonText: text),
              child: Text(
                text,
                style: fontBlack.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
              padding: EdgeInsets.all(20),
              highlightColor: Colors.blueGrey[100],
              splashColor: Colors.blueAccent[100],
            )));
  }
}

bool isNumeric(String str) {
  try {
    var value = double.parse(str);
  } on FormatException {
    return false;
  } finally {
    return true;
  }
}
