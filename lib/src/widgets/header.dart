import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Text text;
  final double topPadding;

  Header({this.text, this.topPadding = 40.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        left: 20.0,
        right: 20.0,
        bottom: 10.0,
      ),
      child: Text(
        text.data,
        style: text?.style ??
            TextStyle(
              fontSize: 40,
              fontFamily: 'Pacifico',
              color: Colors.grey[800],
            ),
      ),
    );
  }
}
