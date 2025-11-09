import 'package:apple/bloc/auth_bloc.dart';
import 'package:apple/bloc/auth_event.dart';
import 'package:apple/bloc/auth_state.dart';
import 'package:apple/signup/name_textfield.dart';
import 'package:apple/signup/password_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({
    super.key,
    required this.emailController,
    required this.formkey,
  });

  final TextEditingController emailController;
  final GlobalKey<FormState> formkey;

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final nameControllerKey = GlobalKey<NameTextFormWidgetState>();
  final passwordControllerKey = GlobalKey<PasswordTextfieldState>();

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
              !EmailValidator.validate(ifemail!) ? 'Enter a valid email' : null,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: 'Apple ID',
            hintStyle: const TextStyle(fontSize: 16),
            //state is loading
            suffixIcon: IconButton(
              hoverColor: CupertinoColors.white,
              icon: const Icon(
                Icons.arrow_circle_right,
                size: 30,
                color: Colors.grey,
              ),
              onPressed: () {
                if (widget.formkey.currentState!.validate()) {
                  // SIGN UP LOGIC
                  if (!state.isSignedIn) {
                    context.read<AuthBloc>().add(SignUpEvent(
                        name: nameControllerKey
                            .currentState!.nameController.text
                            .trim(),
                        password: passwordControllerKey
                            .currentState!.passwordController.text,
                        email: widget.emailController.text.trim()));
                  }
                  context.read<AuthBloc>().add(ProceedToPasswordEvent(
                      email: widget.emailController.text.trim()));
                }
                debugPrint('Email:${widget.emailController.text}');
              },
            ),
          ),
        );
      },
    );
  }
}
