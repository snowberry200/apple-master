import 'package:apple/widgets/validator.dart';
import 'package:flutter/material.dart';

class NameTextFormWidget extends StatefulWidget {
  final TextEditingController nameController;

  const NameTextFormWidget({
    super.key,
    required this.nameController,
  });

  @override
  State<NameTextFormWidget> createState() => NameTextFormWidgetState();
}

class NameTextFormWidgetState extends State<NameTextFormWidget> {
  late TextEditingController nameController;

  @override
  void initState() {
    nameController = widget.nameController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (name) {
        return StatementValidator.validateName(name: name);
      },
      textAlign: TextAlign.start,
      controller: widget.nameController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide()),
          labelText: 'name',
          labelStyle: const TextStyle(
            fontSize: 16,
          )),
      keyboardType: TextInputType.name,
      autofillHints: const [AutofillHints.name],
    );
  }
}
