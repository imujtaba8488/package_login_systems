import 'package:flutter/material.dart';

import '../widgets/text_form_field_02.dart';
import '../global.dart';

class SignUpForm02 extends StatefulWidget {
  final Validator emailValidator, passwordValidator;
  final OnSubmitPressed onSignUpButtonPressed;
  final Function onLinkButtonPressed;

  SignUpForm02({
    this.emailValidator,
    this.passwordValidator,
    this.onSignUpButtonPressed,
    this.onLinkButtonPressed,
  });

  @override
  _SignUpForm02State createState() => _SignUpForm02State();
}

class _SignUpForm02State extends State<SignUpForm02> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email, _password, _firstName, _lastName;

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
            'Create Account',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              'Sign up with Email and Password',
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
              onSaved: (String value) => _email = value.trim(),
              validator: widget.emailValidator,
            ),
            SizedBox(height: 5.0),
            TextFormField02(
              hintText: 'Password',
              onSaved: (String value) => _password = value.trim(),
              validator: widget.passwordValidator,
              obscureText: true,
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextFormField02(
                  width: MediaQuery.of(context).size.width / 2.3,
                  hintText: 'First Name',
                  onSaved: (String value) => _firstName = value.trim(),
                ),
                TextFormField02(
                  width: MediaQuery.of(context).size.width / 2.3,
                  hintText: 'Last Name',
                  onSaved: (String value) => _lastName = value.trim(),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              child: OutlineButton(
                onPressed: _onFormSave,
                child: Text('SIGN UP'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onFormSave() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      if (widget.onSignUpButtonPressed != null) {
        widget.onSignUpButtonPressed(_firstName, _lastName, _email, _password);
      }
    }
  }
}
