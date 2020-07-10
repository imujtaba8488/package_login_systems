import 'package:flutter/material.dart';

import 'package:login_systems/login_systems.dart';

main() => MyApp();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LoginSystem02(
          emailValidator: (String value) {
            if (value.isEmpty) {
              return 'Email cannot be empty.';
            } else {
              return null;
            }
          },
          passwordValidator: (String value) {
            if (value.isEmpty) {
              return 'Password cannot be empty';
            } else {
              return null;
            }
          },
          headerBackgroundColor: Colors.grey,
          onSignInButtonPressed: (email, password) {
            print('$email $password');
          },
          onSignUpButtonPressed: (firstName, lastName, email, password) {
            print('$firstName $lastName $email $password');
          },
        ),
      ),
    );
  }
}
