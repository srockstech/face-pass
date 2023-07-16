import 'dart:io';

import 'package:face_net_authentication/pages/notes_form.dart';
import 'package:face_net_authentication/pages/website_form.dart';
import 'package:face_net_authentication/widgets/app_button.dart';
import 'package:face_net_authentication/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home.dart';
import 'dart:math' as math;
import 'card_form.dart';
import 'website_form.dart';
import 'notes_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_net_authentication/widgets/card_widget.dart';
import 'creditcard.dart';
import 'notes.dart';
import 'websites.dart';

class Profile extends StatelessWidget {
  Profile(this.username, {Key key, this.imagePath}) : super(key: key);
  final String username;
  final String imagePath;
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final double mirror = math.pi;

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
          title: Text('Hey $username!'), backgroundColor: Colors.blue[600]),
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.lightBlueAccent,
        animatedIcon: AnimatedIcons.add_event,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
              child: Icon(FontAwesomeIcons.stickyNote, color: Colors.white),
              backgroundColor: Colors.grey[800],
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NotesInputForm();
                }));
              }),
          SpeedDialChild(
              child: Icon(FontAwesomeIcons.globe, color: Colors.white),
              backgroundColor: Colors.grey[800],
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WebsiteDetailsInputForm();
                }));
              }),
          SpeedDialChild(
              child: Icon(FontAwesomeIcons.creditCard, color: Colors.white),
              backgroundColor: Colors.grey[800],
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CardDetailsInputForm();
                }));
              }),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreditCard()));
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.creditCard,
                      size: 60,
                    ),
                    Divider(),
                    Text(
                      'BANK CARDS',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Divider(
              height: 0,
              color: Colors.grey[850],
              thickness: 2,
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Websites()));
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.globe,
                      size: 60,
                    ),
                    Divider(),
                    Text(
                      'WEBSITES',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Divider(
              height: 0,
              color: Colors.grey[850],
              thickness: 2,
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Notes()));
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.solidStickyNote,
                      size: 60,
                    ),
                    Divider(),
                    Text(
                      'NOTES',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
