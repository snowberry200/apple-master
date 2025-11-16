import 'package:apple/bloc/auth_bloc.dart';
import 'package:apple/bloc/auth_event.dart';
import 'package:apple/bloc/auth_state.dart';
import 'package:apple/passwordScreens/password_text_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordWidget extends StatefulWidget {
  final TextEditingController callback;

  const PasswordWidget({super.key, required this.callback});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool checked = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Apple ID',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Text('Manage your Apple account'),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(widget.callback.text,
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18,
                                    color: Colors.blueAccent)),
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              SizedBox(),
                              Expanded(
                                  flex: 5,
                                  child: PasswordTextForm(
                                    email: widget.callback,
                                    formKey: formKey,
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                                value: state.isChecked,
                                onChanged: (bool? newValue) {
                                  final toggleValue = !state.isChecked;
                                  context.read<AuthBloc>().add(
                                      CheckboxEvent(isChecked: toggleValue));
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
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                  'Forgotten your Apple ID or password?',
                                  style: TextStyle(
                                      fontSize: 12, letterSpacing: 0.5))),
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                  ],
                )));
      },
    );
  }
}
