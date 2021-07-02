import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  String label;
  bool isNumber;
  bool isPassword;

  FormTextField({this.label, this.isNumber = false, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      cursorColor: Theme.of(context).cardColor,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Theme.of(context).cardColor),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).cardColor, width: 2.0),
        ),
      ),
    );
  }
}
