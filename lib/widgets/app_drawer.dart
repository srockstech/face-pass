import 'package:face_pass/pages/creditcard.dart';
import 'package:face_pass/pages/home.dart';
import 'package:face_pass/pages/notes.dart';
import 'package:face_pass/pages/websites.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.blue[600],
        child: ListView(
          children: <Widget>[
            Container(
              padding: padding,
              child: Column(
                children: [
                  // const SizedBox(height: 12),
                  // buildSearchField(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'FacePass',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 25),
                        ),
                        Text(
                          'Secure Password Manager',
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w900,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white70,
                  ),
                  buildMenuItem(
                    text: 'Bank Cards',
                    icon: FontAwesomeIcons.creditCard,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Websites',
                    icon: FontAwesomeIcons.globe,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Notes',
                    icon: FontAwesomeIcons.solidStickyNote,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 24),
                  Divider(
                    color: Colors.white70,
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout,
                    textColor: Colors.red[900],
                    iconColor: Colors.red[900],
                    onClicked: () => selectedItem(context, 4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    String? text,
    IconData? icon,
    VoidCallback? onClicked,
    Color? textColor,
    Color? iconColor,
  }) {
    final hoverColor = Colors.white70;

    return ListTile(
      textColor: textColor,
      leading: Icon(icon, color: iconColor),
      title: Text(text!, style: TextStyle(color: textColor, fontSize: 18)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CreditCard();
        }));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Websites();
        }));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Notes();
        }));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MyHomePage();
        }));
        break;
    }
  }
}
