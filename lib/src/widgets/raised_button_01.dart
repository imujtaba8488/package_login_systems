import 'package:flutter/material.dart';

class RaisedButton01 extends StatelessWidget {
  final Text text;
  final Function onPressed;

  RaisedButton01({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            text.data,
            style: text?.style ??
                TextStyle(
                  color: Colors.white,
                  fontFamily: 'RobotoSlab',
                ),
          ),
        ),
      ),
    );
  }
}
