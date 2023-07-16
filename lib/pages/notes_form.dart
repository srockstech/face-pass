import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:face_net_authentication/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotesInputForm extends StatelessWidget {
  // CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  FirebaseFirestore _firebase = FirebaseFirestore.instance;
  String textNote;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          leading: IconButton(
            splashRadius: 20,
            icon: Icon(Icons.close, color: Colors.white, size: 25),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Add a Note'),
          backgroundColor: Colors.grey[850]),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await _firebase.collection('notes').add({'Note': textNote});
            Navigator.pop(context);
            await Fluttertoast.showToast(
              msg: 'New Note Added',
              fontSize: 16,
            );
          },
          child: Icon(FontAwesomeIcons.check),
          backgroundColor: Colors.lightBlueAccent),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          minLines: 8,
          textInputAction: TextInputAction.newline,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            alignLabelWithHint: true,
            label: Text(
              'Write something...',
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
          onChanged: (value) {
            textNote = value;
          },
        ),
      ),
    );
  }
}
