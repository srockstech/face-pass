import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {Key key,
      @required this.labelText,
      @required this.controller,
      this.keyboardType = TextInputType.text,
      this.autofocus = false,
      this.isPassword = false})
      : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool autofocus;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      controller: this.controller,
      autofocus: this.autofocus,
      cursorColor: Colors.lightBlue,
      decoration: InputDecoration(
        label: Text(
          labelText,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: InputBorder.none,
        filled: true,
        enabledBorder: new OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        focusedBorder: new OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.lightBlue,
          ),
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
      ),
      obscureText: isPassword,
      keyboardType: keyboardType,
    );
  }
}
