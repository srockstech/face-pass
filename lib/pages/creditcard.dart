import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_form.dart';
import 'package:face_net_authentication/widgets/card_widget.dart';

class CreditCard extends StatefulWidget {
  @override
  _CreditcardState createState() => _CreditcardState();
}

class _CreditcardState extends State<CreditCard> {
  FirebaseFirestore _firebase = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:
          AppBar(title: Text('Bank cards'), backgroundColor: Colors.blue[600]),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firebase.collection('cards').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final cardsList = snapshot.data.docs;
            List<ReusableCard> cardsWidgets = [];
            for (var cards in cardsList) {
              String cardsName = cards.get('Card Name');
              String tempCardNumber = cards.get('Card Number');
              String cardNumber = '';
              for (int i = 0; i < tempCardNumber.length; i++) {
                if (i % 4 == 0) {
                  cardNumber += ' ';
                }
                cardNumber += tempCardNumber[i];
              }
              String cardHolder = cards.get('Card Holder');
              String validThrough = cards.get('Valid Through');
              String cardType = cards.get('Card Type');
              String pin = cards.get('PIN');
              String cvv = cards.get('CVV');
              final cardsWidget = ReusableCard(
                colour: Colors.grey[850],
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cardsName,
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text(
                          cardType,
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: Divider(
                        color: Colors.lightBlue,
                      ),
                      width: 1000,
                      height: 20,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Center(
                      child: Text(
                        cardNumber,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          validThrough,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'PIN ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            Text(
                              pin,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cardHolder,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Row(
                          children: [
                            Text(
                              'CVV ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            Text(
                              cvv,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
              cardsWidgets.add(cardsWidget);
            }

            return (cardsWidgets.length == 0)
                ? Container(
                    padding: EdgeInsets.all(70),
                    child: Center(
                      child: Text(
                        'You have not added any cards yet.',
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
                    itemCount: cardsWidgets.length,
                    itemBuilder: (context, index) {
                      return cardsWidgets[index];
                    },
                  );
          }
          return Container(
              // child: Text('You have not added any cards yet.'),
              );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CardDetailsInputForm();
            }));
          },
          child: Icon(FontAwesomeIcons.plus, size: 16),
          backgroundColor: Colors.lightBlueAccent),
    );
  }
}
