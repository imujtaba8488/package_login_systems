import 'package:flutter/material.dart';

import '../forms/sign_in_form_01.dart';
import '../forms/sign_up_form_01.dart';
import '../global.dart';

class LoginSystem01 extends StatelessWidget {
  final Validator emailValidator, passwordValidator;
  final OnSignInButtonPressed onSignInButtonPressed;
  final OnSubmitPressed onSubmitPressed;
  final Function onLinkPressed;
  final Text signInButtonLabel,
      submitButtonLabel,
      linkLabel,
      signInHeaderText,
      signUpHeaderText,
      signInTabText,
      signUpTabText;

  LoginSystem01({
    this.onSignInButtonPressed,
    this.onSubmitPressed,
    this.onLinkPressed,
    this.emailValidator,
    this.passwordValidator,
    this.signInButtonLabel = const Text('Sign In'),
    this.submitButtonLabel = const Text('Submit'),
    this.linkLabel = const Text('Forgot Password?'),
    this.signInHeaderText = const Text('Welcome Back!'),
    this.signUpHeaderText = const Text('Sign Up!'),
    this.signInTabText = const Text('Sign In'),
    this.signUpTabText = const Text('Create Account'),
  });

  @override
  Widget build(BuildContext context) {
    final double _tabBarHeight = 60;

    // 60px for any additional padding.
    double _formHeight =
        MediaQuery.of(context).size.height - (_tabBarHeight + 60);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(8),
                  height: _tabBarHeight,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TabBar(
                    labelPadding: EdgeInsets.all(0),
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 5,
                        color: Colors.white,
                      ),
                      insets: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                    ),
                    tabs: <Widget>[
                      _customizedTab(signInTabText),
                      _customizedTab(signUpTabText),
                    ],
                  ),
                ),
                Container(
                  height: _formHeight,
                  child: TabBarView(
                    children: <Widget>[
                      SignInForm01(
                        headerText: signInHeaderText,
                        signInButtonLabel: signInButtonLabel,
                        emailValidator: emailValidator,
                        passwordValidator: passwordValidator,
                        linkLabel: linkLabel,
                        onSignInButtonPressed: onSignInButtonPressed,
                        onLinkPressed: onLinkPressed,
                      ),
                      SignUpForm01(
                        headerText: signUpHeaderText,
                        submitButtonLabel: submitButtonLabel,
                        emailValidator: emailValidator,
                        passwordValidator: passwordValidator,
                        onSubmitPressed: onSubmitPressed,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customizedTab(Text label) {
    return Text(
      label.data,
      style: label?.style ?? TextStyle(fontFamily: 'RobotoSlab'),
    );
  }
}
