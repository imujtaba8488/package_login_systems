import 'package:flutter/material.dart';

import '../global.dart';

class TextFormField02 extends StatelessWidget {
  final String hintText;
  final Color fillColor, hintTextColor;
  final Validator validator;
  final Function onSaved;
  final bool obscureText;
  final double width;

  TextFormField02({
    this.hintText,
    this.fillColor = const Color(0xFFC0C0C0),
    this.hintTextColor = Colors.white,
    this.validator,
    this.onSaved,
    this.obscureText = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none,
          ),
          fillColor: fillColor,
          filled: true,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: hintTextColor,
          ),
        ),
        obscureText: obscureText,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
