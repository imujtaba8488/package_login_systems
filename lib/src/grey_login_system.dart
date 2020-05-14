import 'package:flutter/material.dart';

class GreyLoginSystem extends StatefulWidget {
  /// Adds validation to email / password field.
  final Validator emailValidator, passwordValidator;

  /// Action to be taken when the signIn button is pressed.
  final OnSignInPressed onSignInPressed;

  /// Action to be taken when the submit button is pressed.
  final OnSubmitPressed onSubmitPressed;

  /// Action to be taken when the link button is pressed.
  final Function onLinkPressed;

  /// Text that should appear in the field.
  final String signInText,
      submitText,
      linkText,
      signInHeaderLabel,
      signUpHeaderLabel;

  GreyLoginSystem({
    this.onSignInPressed,  
    this.onSubmitPressed,
    this.onLinkPressed,
    this.emailValidator,
    this.passwordValidator,
    this.signInText = 'Sign In',
    this.submitText = 'Submit',
    this.linkText = 'Forgot Password?',
    this.signInHeaderLabel = 'Welcome Back!',
    this.signUpHeaderLabel = 'Sign Up!',
  });

  @override
  _GreyLoginSystemState createState() => _GreyLoginSystemState();
}

class _GreyLoginSystemState extends State<GreyLoginSystem> {
  GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  String _firstName, _lastName, _email, _password;
  double _tabBarHeight = 60;
  double _formHeight;
  double _nameFieldWidth;

  @override
  Widget build(BuildContext context) {
    // 60px for any additional padding. 
    _formHeight = MediaQuery.of(context).size.height - (_tabBarHeight + 60);

    // 2.5 takes into consideration any padding as well.
    _nameFieldWidth = MediaQuery.of(context).size.width / 2.5;

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
                      _customizedTab('Login'),
                      _customizedTab('Create Account'),
                    ],
                  ),
                ),
                Container(
                  height: _formHeight,
                  child: TabBarView(
                    children: <Widget>[
                      _signInForm(),
                      _signUpForm(),
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

  /// Returns the sign-in form.
  Widget _signInForm() {
    return Form(
      key: _signInFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _headerLabel(widget.signInHeaderLabel),
            _customizedTextFormField(
              'Email',
              suffixIcon: Icon(Icons.email),
              validator: widget.emailValidator,
              onSaved: (String value) => _email = value,
            ),
            _customizedTextFormField(
              'Password',
              suffixIcon: Icon(Icons.lock),
              validator: widget.passwordValidator,
              onSaved: (String value) => _email = value,
            ),
            _customizedRaisedButton(
              text: widget.signInText,
              onPressed: _onSignInFormSaved,
            ),
            _customizedLinkButton(
              text: widget.linkText,
              onPressed: widget.onLinkPressed,
            ),
          ],
        ),
      ),
    );
  }

  /// Returns the sign-up form.
  Widget _signUpForm() {
    return Form(
      key: _signupFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _headerLabel(widget.signUpHeaderLabel, topPadding: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _customizedTextFormField(
                    'First Name',
                    width: _nameFieldWidth,
                    padding: EdgeInsets.all(0.0),
                    onSaved: (String value) => _firstName = value,
                  ),
                  _customizedTextFormField(
                    'Last Name',
                    width: _nameFieldWidth,
                    padding: EdgeInsets.all(0.0),
                    onSaved: (String value) => _lastName = value,
                  )
                ],
              ),
            ),
            _customizedTextFormField(
              'Email',
              suffixIcon: Icon(Icons.email),
              validator: widget.emailValidator,
              onSaved: (String value) => _email = value,
            ),
            _customizedTextFormField(
              'Password',
              suffixIcon: Icon(Icons.lock),
              validator: widget.passwordValidator,
              onSaved: (String value) => _password = value,
            ),
            _customizedRaisedButton(
              text: widget.submitText,
              onPressed: _onSignupFormSaved,
            ),
          ],
        ),
      ),
    );
  }

  /// Returns a customized tab.
  Widget _customizedTab(String label) {
    return Text(
      label,
      style: TextStyle(fontFamily: 'RobotoSlab'),
    );
  }

  /// Returns the label to be displayed along the top of the page.
  Widget _headerLabel(String text, {double topPadding = 40.0}) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        left: 20.0,
        right: 20.0,
        bottom: 10.0,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 40,
          fontFamily: 'Pacifico',
          color: Colors.grey[800],
        ),
      ),
    );
  }

  /// Returns a customized TextFormField.
  Widget _customizedTextFormField(
    String label, {
    double width,
    Icon suffixIcon,
    EdgeInsets padding,
    Function validator,
    Function onSaved,
  }) {
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
      ),
    );
  }

  /// Returns a customized Raised Button.
  Widget _customizedRaisedButton({@required String text, Function onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'RobotoSlab',
            ),
          ),
        ),
      ),
    );
  }

  /// Returns a customized link button, sought of like a FlatButton.
  Widget _customizedLinkButton({@required String text, @required onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Center(
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: Colors.grey[800],
            fontFamily: 'RobotoSlab',
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  /// Controls how the signInForm is saved.
  void _onSignInFormSaved() {
    if (_signInFormKey.currentState.validate()) {
      _signInFormKey.currentState.save();
      widget.onSignInPressed != null
          ? widget.onSignInPressed(_email, _password)
          : print('Error: No Implementation Provided');
    }
  }

  /// Controls how the signUpForm is saved.
  void _onSignupFormSaved() {
    if (_signupFormKey.currentState.validate()) {
      _signupFormKey.currentState.save();
      widget.onSubmitPressed != null
          ? widget.onSubmitPressed(_firstName, _lastName, _email, _password)
          : print('Error: No Implementation Provided.');
    }
  }
}

/// A field validator.
typedef Validator = void Function(String value);

/// Defines the action to be taken when signInButton is pressed.
typedef OnSignInPressed = void Function(String email, String password);

/// Defines the action to be taken when signUpButton is pressed.
typedef OnSubmitPressed = void Function(
  String firstName,
  String lastName,
  String email,
  String password,
);
