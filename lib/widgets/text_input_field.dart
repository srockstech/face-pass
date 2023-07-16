import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  Function onChanged;
  TextInputField({@required this.hintText, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          label: Text(
            hintText,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.lightBlue,
              width: 2.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
