import 'package:flutter/material.dart';

import '../widgets/text_form_field_01.dart';
import '../widgets/raised_button_01.dart';
import '../widgets/header.dart';
import '../widgets/link_button_01.dart';
import '../global.dart';

class SignInForm01 extends StatefulWidget {
  final Text headerText, signInButtonLabel, linkLabel;
  final Validator emailValidator, passwordValidator;
  final OnSignInButtonPressed onSignInButtonPressed;
  final Function onLinkPressed;

  SignInForm01({
    this.headerText = const Text('Welcome Back!'),
    this.signInButtonLabel = const Text('Sign In'),
    this.linkLabel = const Text('Forgot Password?'),
    this.emailValidator,
    this.passwordValidator,
    this.onSignInButtonPressed,
    this.onLinkPressed,
  });

  @override
  _SignInForm01State createState() => _SignInForm01State();
}

class _SignInForm01State extends State<SignInForm01> {
  GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();

  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signInFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(text: widget.headerText),
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
              text: widget.signInButtonLabel,
              onPressed: _onSignInFormSaved,
            ),
            LinkButton01(
              text: widget.linkLabel,
              onPressed: widget.onLinkPressed,
            ),
          ],
        ),
      ),
    );
  }

  // Action to be taken when the form is saved.
  void _onSignInFormSaved() {
    if (_signInFormKey.currentState.validate()) {
      _signInFormKey.currentState.save();
      widget.onSignInButtonPressed != null
          ? widget.onSignInButtonPressed(_email, _password)
          : print('Error: No Implementation Provided');
    }
  }
}
