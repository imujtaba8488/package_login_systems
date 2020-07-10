/// A field validator.
typedef Validator = void Function(String value);

/// Signatures
typedef OnSignInButtonPressed = void Function(String email, String password);

/// Defines the action to be taken when signUpButton is pressed.
typedef OnSubmitPressed = void Function(
  String firstName,
  String lastName,
  String email,
  String password,
);
