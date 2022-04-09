import 'package:ctse_frontend/colors/colors.dart';
import 'package:ctse_frontend/main.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNotificationSwitched = false;
  bool isPopupSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(
                  title: 'Scrum Board',
                ),
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: Column(children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text("Notification Settings ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(right: 238.0, top: 30),
              child: Text('Notifications',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
            Row(children: [
              Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, top: 10),
                  child: Text('Receive notifications on latest ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 74.0, top: 5),
                  child: Text('recent matches',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ),
              ]),
              Padding(
                  padding: const EdgeInsets.only(left: 65.0, top: 30),
                  child: Transform.scale(
                    scale: 1.2,
                    child: Switch(
                      value: isNotificationSwitched,
                      onChanged: (value) {
                        setState(() {
                          isNotificationSwitched = value;
                          print(isNotificationSwitched);
                        });
                      },
                      activeTrackColor: colors.green1,
                      activeColor: colors.Navbarcolor,
                    ),
                  ))
            ]),
          ])),
          SizedBox(
            height: 30,
          ),
          Container(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(right: 280.0, top: 30),
              child: Text('Popups',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
            Row(children: [
              Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 10),
                  child: Text('Disable all popups and adverts from ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 90.0, top: 5),
                  child: Text('third party vendors',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ),
              ]),
              Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 30),
                  child: Transform.scale(
                    scale: 1.2,
                    child: Switch(
                        value: isPopupSwitched,
                        onChanged: (value) {
                          setState(() {
                            isPopupSwitched = value;
                            print(isPopupSwitched);
                          });
                        },
                        activeTrackColor: colors.green1,
                        activeColor: colors.Navbarcolor),
                  ))
            ]),
          ])),
          SizedBox(
            height: 25,
          ),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                primary: Colors.teal, // background
                onPrimary: colors.bgColor, // foreground
              ),
              child: Text('UPDATE SETTINGS',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
              onPressed: () {},
            ),
          ),
        ]));
  }
}
