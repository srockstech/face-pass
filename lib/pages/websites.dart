import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'website_form.dart';
import 'package:face_net_authentication/widgets/card_widget.dart';

class Websites extends StatefulWidget {
  @override
  _WebsitesState createState() => _WebsitesState();
}

class _WebsitesState extends State<Websites> {
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
          AppBar(title: Text('Websites'), backgroundColor: Colors.blue[600]),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firebase.collection('credentials').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final websitesList = snapshot.data.docs;
            List<ReusableCard> websitesWidgets = [];
            for (var website in websitesList) {
              String userName = website.get('Username');
              String websitesURL = website.get('Website URL');
              String password = website.get('Password');
              final websitesWidget = ReusableCard(
                colour: Colors.grey[850],
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        websitesURL,
                        style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      child: Divider(
                        color: Colors.lightBlue,
                      ),
                      width: 1000,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text(
                          userName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text(
                          password,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              );
              websitesWidgets.add(websitesWidget);
            }

            return (websitesWidgets.length == 0)
                ? Container(
                    padding: EdgeInsets.all(70),
                    child: Center(
                      child: Text(
                        'You have not added any credentials yet.',
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
                    itemCount: websitesWidgets.length,
                    itemBuilder: (context, index) {
                      return websitesWidgets[index];
                    },
                  );
          }
          return Container(
              // child: Text('You have not added any credentials yet.'),
              );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WebsiteDetailsInputForm();
            }));
          },
          child: Icon(FontAwesomeIcons.plus, size: 16),
          backgroundColor: Colors.lightBlueAccent),
    );
  }
}
