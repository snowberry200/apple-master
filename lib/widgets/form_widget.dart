import 'package:apple/HomeLayOuts/passlayout.dart';
import 'package:apple/bloc/auth_bloc.dart';
import 'package:apple/bloc/auth_state.dart';
import 'package:apple/widgets/email_text_field.dart';
import 'package:apple/signup/name_textfield.dart';
import 'package:apple/signup/password_field.dart';
import 'package:apple/widgets/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool checked = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          StatementValidator.validateAuthStates(context, state);
        }
        if (state is AuthLoadingState) {
          StatementValidator.showProgressiveBar();
        }
        if (state is AppleIdContinueState) {
          StatementValidator.validateAuthStates(context, state);
          Future.delayed(Duration(seconds: 5));
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PassLayout(
                    email: emailController,
                  )));
        }
        if (state is SignedUpState) {
          StatementValidator.validateAuthStates(context, state);
        }
      },
      builder: (context, state) {
        return Form(
          key: formkey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10.0, right: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Apple ID',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      TextButton(
                          onPressed: () {},
                          child: Text('Manage your Apple account')),
                      SizedBox(height: 10),
                      if (!state.isSignedIn) ...[
                        NameTextFormWidget(
                          nameController: nameController,
                        ),
                        SizedBox(height: 10),
                        PasswordTextfield(
                            passwordController: passwordController),
                      ],
                      SizedBox(height: 10),
                      SizedBox(
                        child: Row(
                          children: [
                            SizedBox(),
                            Expanded(
                              flex: 5,
                              child: EmailTextField(
                                  emailController: emailController,
                                  formkey: formkey),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: checked,
                              onChanged: (unchecked) {
                                setState(() {
                                  checked = !checked;
                                });
                              },
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              hoverColor: CupertinoColors.white,
                              checkColor: CupertinoColors.white,
                              activeColor: CupertinoColors.systemBlue),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text('Remember me',
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      if (state.isSignedIn)
                        Align(
                          alignment: AlignmentGeometry.topLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                  'Forgotten your Apple ID or password?',
                                  style: TextStyle(
                                      fontSize: 12, letterSpacing: 0.1))),
                        ),
                    ],
                  ),
                ),
                Expanded(child: SizedBox())
              ],
            ),
          ),
        );
      },
    );
  }
}
