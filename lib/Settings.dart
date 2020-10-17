import 'package:design_app/EditProfile.dart';

import 'package:design_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Color orange = Color(0XFFd45a29);

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Future<void> _signOut() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs?.clear();
      await FirebaseAuth.instance.signOut();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } catch (e) {
      print(e); //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: new IconThemeData(color: orange),
          backgroundColor: Colors.white,
          title: Text(
            "Settings",
            style: TextStyle(
              color: orange,
              fontSize: 18,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 250,
              color: orange,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Image.asset(
                    "assets/logoo.jpeg",
                    height: 100,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "DON'T GO 2 PRISON",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "1.0.0",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
                height: 50,
                color: Colors.white,
                child: ListTile(
                    leading: Text("Profile",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: orange,
                        )))),
            Container(
                color: Color(0xFAEC7843),
                child: ListTile(
                  leading: Text("Edit Profile",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile()),
                        );
                      }),
                )),
            Container(
                height: 50,
                color: Colors.white,
                child: ListTile(
                    leading: Text("Account",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: orange,
                        )))),
            Container(
                color: Color(0xFAEC7843),
                child: ListTile(
                  leading: Text("Logout",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  trailing: IconButton(
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        _signOut();
                      }),
                ))
          ],
        ));
  }
}
