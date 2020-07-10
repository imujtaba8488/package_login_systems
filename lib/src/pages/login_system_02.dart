import 'package:flutter/material.dart';

import '../forms/sign_in_form_02.dart';
import '../forms/sign_up_form_02.dart';
import '../global.dart';

class LoginSystem02 extends StatelessWidget {
  /// Sets the email validation.
  final Validator emailValidator;

  /// Sets the password validation.
  final Validator passwordValidator;

  /// Define the action to be taken when the Sign In Button is pressed. The callback retrieves email and password, in order.
  final OnSignInButtonPressed onSignInButtonPressed;

  /// Defines the action to be taken when the Sign Up Button is pressed. The callback retrieves firstName, lastName, email, and password, in order.
  final OnSubmitPressed onSignUpButtonPressed;

  /// Defines the action to be taken when the link button is pressed.
  final Function onLinkButtonPressed;

  /// The background color of the header.
  final Color headerBackgroundColor;

  /// The widget to be placed inside the header.
  final Widget header;

  LoginSystem02({
    this.emailValidator,
    this.passwordValidator,
    this.onSignInButtonPressed,
    this.onSignUpButtonPressed,
    this.onLinkButtonPressed,
    this.headerBackgroundColor = const Color(0xFF02072F),
    this.header = const Text(
      'Welcome Back!',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 4.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: headerBackgroundColor,
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: header,
                      ),
                    ),
                    _tabBar(),
                  ],
                ),
              ),
              Expanded(
                child: _tabBarView(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      height: 35,
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TabBar(
        indicator: UnderlineTabIndicator(
          insets: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 5.0,
          ),
        ),
        tabs: <Widget>[
          Tab(child: Text('SIGN IN')),
          Tab(child: Text('SIGN UP')),
        ],
      ),
    );
  }

  Widget _tabBarView() {
    return TabBarView(
      children: <Widget>[
        SingleChildScrollView(
          child: SignInForm02(
            emailValidator: emailValidator,
            passwordValidator: passwordValidator,
            onSignInButtonPressed: onSignInButtonPressed,
            onLinkButtonPressed: onSignInButtonPressed,
          ),
        ),
        SingleChildScrollView(
          child: SignUpForm02(
            emailValidator: emailValidator,
            passwordValidator: passwordValidator,
            onSignUpButtonPressed: onSignUpButtonPressed,
            onLinkButtonPressed: onSignInButtonPressed,
          ),
        ),
      ],
    );
  }
}
