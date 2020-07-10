import 'package:flutter/material.dart';

import '../widgets/link_button_01.dart';
import '../widgets/text_form_field_02.dart';
import '../global.dart';

class SignInForm02 extends StatefulWidget {
  final Validator emailValidator, passwordValidator;
  final OnSignInButtonPressed onSignInButtonPressed;
  final Function onLinkButtonPressed;

  SignInForm02({
    this.emailValidator,
    this.passwordValidator,
    this.onSignInButtonPressed,
    this.onLinkButtonPressed,
  });

  @override
  _SignInForm02State createState() => _SignInForm02State();
}

class _SignInForm02State extends State<SignInForm02> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _header(),
        _form(),
      ],
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          Text(
            'Access Account',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              'Sign in with Email and Password',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        child: Column(
          children: <Widget>[
            TextFormField02(
              hintText: 'Email',
              onSaved: (String value) => _email = value,
              validator: widget.emailValidator,
            ),
            SizedBox(height: 5.0),
            TextFormField02(
              hintText: 'Password',
              onSaved: (String value) => _password = value,
              validator: widget.passwordValidator,
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: LinkButton01(onPressed: widget.onLinkButtonPressed),
                ),
                OutlineButton(
                  onPressed: _onFormSave,
                  child: Text('Sign In'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onFormSave() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      if (widget.onSignInButtonPressed != null) {
        widget.onSignInButtonPressed(_email, _password);
      }
    }
  }
}
