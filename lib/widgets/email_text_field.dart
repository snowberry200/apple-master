import 'package:apple/bloc/auth_bloc.dart';
import 'package:apple/bloc/auth_event.dart';
import 'package:apple/bloc/auth_state.dart';
import 'package:apple/widgets/validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({
    super.key,
    required this.emailController,
    required this.formkey,
    required this.nameController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formkey;

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  void handleLogin() {
    if (widget.formkey.currentState!.validate()) {
      context.read<AuthBloc>().add(
          ProceedToPasswordEvent(email: widget.emailController.text.trim()));
      debugPrint('Email:${widget.emailController.text}');
    }
  }

  void handleSignup() {
    // Validate all fields in real-time
    final isNameValid =
        StatementValidator.validateName(name: widget.nameController.text) ==
            null;
    final isEmailValid =
        EmailValidator.validate(widget.emailController.text.trim());
    final isPasswordValid = StatementValidator.validatePassword(
            password: widget.passwordController.text) ==
        null;

    debugPrint(
        'Signup Validation - Name: $isNameValid, Email: $isEmailValid, Password: $isPasswordValid');

    if (isNameValid && isEmailValid && isPasswordValid) {
      context.read<AuthBloc>().add(SignUpEvent(
            name: widget.nameController.text.trim(),
            password: widget.passwordController.text.trim(),
            email: widget.emailController.text.trim(),
          ));
      debugPrint('SignUp event dispatched for: ${widget.emailController.text}');
    } else {
      debugPrint('Signup validation failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          enableIMEPersonalizedLearning: true,
          selectionControls: CupertinoTextSelectionControls(),
          textCapitalization: TextCapitalization.none,
          enableInteractiveSelection: true,
          autofillHints: const [AutofillHints.email],
          enableSuggestions: true,
          autocorrect: true,
          showCursor: true,
          autofocus: false,
          textAlign: TextAlign.start,
          strutStyle: const StrutStyle(),
          style: const TextStyle(),
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.emailAddress,
          controller: widget.emailController,
          validator: (ifemail) =>
              StatementValidator.validateEmail(email: ifemail),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: 'Apple ID',
            hintStyle: const TextStyle(fontSize: 16),
            suffixIcon: IconButton(
              hoverColor: CupertinoColors.white,
              icon: const Icon(
                Icons.arrow_circle_right,
                size: 30,
                color: Colors.grey,
              ),
              onPressed: () {
                if (widget.formkey.currentState!.validate()) {
                  !state.isSignedIn ? handleSignup() : handleLogin();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
