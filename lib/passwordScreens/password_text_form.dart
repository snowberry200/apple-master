import 'package:apple/Verify/verifylayout.dart';
import 'package:apple/bloc/auth_bloc.dart' show AuthBloc;
import 'package:apple/bloc/auth_event.dart';
import 'package:apple/bloc/auth_state.dart';

import 'package:apple/widgets/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordTextForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController email;
  const PasswordTextForm({
    super.key,
    required this.formKey,
    required this.email,
  });

  @override
  State<PasswordTextForm> createState() => PasswordTextFormState();
}

class PasswordTextFormState extends State<PasswordTextForm> {
  TextEditingController passwordController = TextEditingController();

  Future<void> handleLogin() async {
    if (!widget.formKey.currentState!.validate()) {
      return;
    }
    context.read<AuthBloc>().add(ProceedToEmailVerifyEvent());
  }

  void _navigateToVerifyPage(BuildContext context) {
    // Use WidgetsBinding to ensure safe navigation after frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VerifyLayoutPage(
            appleEmail: widget.email,
            applePassword: passwordController,
          ),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AppleIdAuthenticatedState) {
          StatementValidator.validateAuthStates(context, state);
          if (context.mounted) {
            _navigateToVerifyPage(context);
          }
        }
      },
      builder: (context, state) {
        return TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          showCursor: true,
          autofocus: false,
          textAlign: TextAlign.start,
          strutStyle: const StrutStyle(),
          style: const TextStyle(),
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
          controller: passwordController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10, right: 15),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            hintText: 'password',
            hintStyle: const TextStyle(fontSize: 18),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0, bottom: 0),
              child: state is AuthLoadingState
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StatementValidator.showProgressiveBar())
                  : IconButton(
                      hoverColor: CupertinoColors.white,
                      icon: const Icon(
                        Icons.arrow_circle_right,
                        size: 30,
                        color: Colors.grey,
                      ),
                      onPressed: handleLogin),
            ),
          ),
          validator: (ifpassword) {
            StatementValidator.validatePassword(password: ifpassword);
            return null;
          },
        );
      },
    );
  }
}
