import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:face_net_authentication/widgets/text_input_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardDetailsInputForm extends StatelessWidget {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;
  final _cardFields = [
    'Card name',
    'Card number',
    'Card type',
    'Card holder',
    'Valid through',
    'CVV',
    'PIN'
  ];
  // bool allFieldsFilled;
  List<dynamic> _cardFieldValues = [null, null, null, null, null, null, null];
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
          title: Text('Enter Card Details'),
          backgroundColor: Colors.grey[850]),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // allFieldsFilled = true;
            // for (int i = 0; i < 8; i++) {
            //   if (_cardFieldValues[i] == null) {
            //     allFieldsFilled = false;
            //   }
            // }

            // if (allFieldsFilled == true) {
            await _firebase.collection('cards').add({
              'Card Name': _cardFieldValues[0],
              'Card Number': _cardFieldValues[1],
              'Card Type': _cardFieldValues[2],
              'Card Holder': _cardFieldValues[3],
              'Valid Through': _cardFieldValues[4],
              'CVV': _cardFieldValues[5],
              'PIN': _cardFieldValues[6],
            });
            Navigator.pop(context);
            await Fluttertoast.showToast(
              msg: 'New Card Added',
              fontSize: 16,
            );
            // }
          },
          child: Icon(FontAwesomeIcons.check),
          backgroundColor: Colors.lightBlueAccent),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _cardFields.length,
          itemBuilder: (listViewContext, index) {
            return TextInputField(
              hintText: _cardFields[index],
              onChanged: (value) {
                _cardFieldValues[index] = value;
              },
            );
          },
        ),
      ),
    );
  }
}
