import 'package:flutter/material.dart';

class LinkButton01 extends StatelessWidget {
  final Text text;
  final Function onPressed;

  LinkButton01({
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
