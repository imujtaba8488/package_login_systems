import 'package:flutter/material.dart';

class CustomizedLinkButton extends StatelessWidget {
  final Text text;
  final Function onPressed;

  CustomizedLinkButton({
    this.text = const Text('Forgot Password'),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Center(
        child: Text(
          text.data,
          style: text?.style ??
              TextStyle(
                color: Colors.grey[800],
                fontFamily: 'RobotoSlab',
                decoration: TextDecoration.underline,
              ),
        ),
      ),
    );
  }
}
