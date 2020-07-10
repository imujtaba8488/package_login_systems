import 'package:flutter/material.dart';

import '../widgets/text_form_field_01.dart';
import '../widgets/raised_button_01.dart';
import '../widgets/header.dart';
import '../global.dart';

class SignUpForm01 extends StatefulWidget {
  final Text headerText, submitButtonLabel;
  final Validator emailValidator, passwordValidator;
  final OnSubmitPressed onSubmitPressed;

  SignUpForm01({
    this.submitButtonLabel = const Text('Submit'),
    this.headerText = const Text('Sign Up!'),
    this.emailValidator,
    this.passwordValidator,
    this.onSubmitPressed,
  });

  @override
  _SignUpForm01State createState() => _SignUpForm01State();
}

class _SignUpForm01State extends State<SignUpForm01> {
  GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  String _firstName, _lastName, _email, _password;

  double _nameFieldWidth;

  @override
  Widget build(BuildContext context) {
    // 2.5 takes into consideration padding as well.
    _nameFieldWidth = MediaQuery.of(context).size.width / 2.5;

    return Form(
      key: _signUpFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(text: widget.headerText, topPadding: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextFormField01(
                    label: 'First Name',
                    width: _nameFieldWidth,
                    padding: EdgeInsets.all(0.0),
                    onSaved: (String value) => _firstName = value,
                  ),
                  TextFormField01(
                    label: 'Last Name',
                    width: _nameFieldWidth,
                    padding: EdgeInsets.all(0.0),
                    onSaved: (String value) => _lastName = value,
                  )
                ],
              ),
            ),
            TextFormField01(
              label: 'Email',
              suffixIcon: Icon(Icons.email),
              validator: widget.emailValidator,
              onSaved: (String value) => _email = value,
              textInputType: TextInputType.emailAddress,
            ),
            TextFormField01(
              label: 'Password',
              suffixIcon: Icon(Icons.lock),
              validator: widget.passwordValidator,
              onSaved: (String value) => _password = value,
              obscureText: true,
            ),
            RaisedButton01(
              text: widget.submitButtonLabel,
              onPressed: _onSignUpFormSaved,
            ),
          ],
        ),
      ),
    );
  }

  void _onSignUpFormSaved() {
    if (_signUpFormKey.currentState.validate()) {
      _signUpFormKey.currentState.save();
      widget.onSubmitPressed != null
          ? widget.onSubmitPressed(_firstName, _lastName, _email, _password)
          : print('Error: No Implementation Provided.');
    }
  }
}
