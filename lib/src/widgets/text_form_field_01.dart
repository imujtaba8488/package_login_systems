import 'package:flutter/material.dart';

class TextFormField01 extends StatelessWidget {
  final String label;
  final double width;
  final Icon suffixIcon;
  final EdgeInsets padding;
  final Function validator;
  final Function onSaved;
  final TextInputType textInputType;
  final bool obscureText;

  TextFormField01({
    this.label,
    this.width,
    this.suffixIcon,
    this.padding,
    this.validator,
    this.onSaved,
    this.textInputType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
      width: width,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontFamily: 'RobotoSlab',
            color: Colors.grey[800],
          ),
          suffixIcon: Icon(
            suffixIcon?.icon,
            color: Colors.grey[800],
          ),
        ),
        validator: validator,
        onSaved: onSaved,
        keyboardType: textInputType,
        obscureText: obscureText,
      ),
    );
  }
}
