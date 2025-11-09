import 'package:apple/bloc/auth_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatementValidator {
  StatementValidator._();

  static void showSnackBar(
      {required BuildContext context,
      required String message,
      required Color color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static void showLoggedInStatement(BuildContext context, String message) {
    showSnackBar(context: context, message: message, color: Colors.green);
  }

  static void showSignUpMessage(BuildContext context, String message) {
    showSnackBar(color: Colors.green, context: context, message: message);
  }

  static void authValidateErrorMessage(BuildContext context, String message) {
    showSnackBar(color: Colors.red, context: context, message: message);
  }

  static void proceedToVerify(BuildContext context, String message) {
    showSnackBar(color: Colors.green, context: context, message: message);
  }

  static void appleIdVerifiedStatement(BuildContext context, String message) {
    showSnackBar(color: Colors.green, context: context, message: message);
  }

  static void verify(BuildContext context, String message) {
    showSnackBar(context: context, message: message, color: Colors.blue);
  }

// validate States
  static bool validateAuthStates(
    BuildContext context,
    AuthState? state,
  ) {
    bool isValid = true;

    if (state is AuthErrorState) {
      authValidateErrorMessage(context, state.message);
      isValid = false;
    }
    if (state is SignedUpState) {
      showSignUpMessage(
          context, 'Account created successfully. Please sign in.');
    }
    if (state is AppleIdContinueState) {
      appleIdVerifiedStatement(context, 'Apple id has been verified ');
      appleIdVerifiedStatement(context, ' proceed to enter password ');
    }
    if (state is AppleIdAuthenticatedState) {
      proceedToVerify(
          context, " proceed to verify details registered with apple ");
    }
    return isValid;
  }

  static CircularProgressIndicator showProgressiveBar() {
    return const CircularProgressIndicator(
      strokeCap: StrokeCap.square,
      backgroundColor: CupertinoColors.darkBackgroundGray,
      valueColor: AlwaysStoppedAnimation<Color>(CupertinoColors.systemBlue),
      strokeWidth: 5.0,
    );
  }

  static String? validateName({required String? name}) {
    if (name == null || name.isEmpty) {
      return 'Name field cannot be empty';
    } else if (name.length < 4) {
      return 'Please enter a correct name (min 4 characters)';
    }
    return null;
  }

  static dynamic validateEmail({required String? email}) {
    if (!EmailValidator.validate(email!)) {
      return 'Enter a valid email';
    }
  }

  static String? validatePassword({required String? password}) {
    if (password == null || password.isEmpty) {
      return 'Password field cannot be empty';
    } else if (password.length < 5) {
      return 'Password cannot be less than 5 characters';
    }
    return null;
  }
}
