import 'package:apple/widgets/validator.dart';
import 'package:flutter/material.dart';

class PasswordTextfield extends StatefulWidget {
  final TextEditingController passwordController;

  const PasswordTextfield({super.key, required this.passwordController});

  @override
  PasswordTextfieldState createState() => PasswordTextfieldState();
}

class PasswordTextfieldState extends State<PasswordTextfield> {
  late TextEditingController passwordController;
  bool _obscureText = true;
  @override
  @override
  void initState() {
    super.initState();
    passwordController = widget.passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      validator: (value) {
        return StatementValidator.validatePassword(password: value);
      },
    );
  }
}
