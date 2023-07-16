import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'notes_form.dart';
import 'package:face_net_authentication/widgets/card_widget.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  FirebaseFirestore _firebase = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Notes'), backgroundColor: Colors.blue[600]),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firebase.collection('notes').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final notesList = snapshot.data.docs;
            List<ReusableCard> notesWidgets = [];
            for (var note in notesList) {
              String notesText = note.get('Note');
              final notesWidget = ReusableCard(
                colour: Colors.grey[850],
                cardChild: Text(
                  notesText,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
              );
              notesWidgets.add(notesWidget);
            }

            return (notesWidgets.length == 0)
                ? Container(
                    padding: EdgeInsets.all(70),
                    child: Center(
                      child: Text(
                        'You have not added any notes yet.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: notesWidgets.length,
                    itemBuilder: (listViewContext, index) {
                      return notesWidgets[index];
                    },
                  );
          }
          return Container(
              // child: Text('You have not added any notes yet.'),
              );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return NotesInputForm();
            }));
          },
          child: Icon(FontAwesomeIcons.plus, size: 16),
          backgroundColor: Colors.lightBlueAccent),
    );
  }
}
