import 'dart:ui';

import 'package:design_app/AddtoPostScreen.dart';
import 'package:design_app/Settings.dart';
import 'package:design_app/main.dart';
import 'package:design_app/searchscreen.dart';
import 'package:design_app/userprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'stories.dart';

final Color orange = Color(0XFFd45a29);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File imagefile;
  _openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imagefile = picture;
    });
  }

  _openCamera() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imagefile = picture;
    });
  }

  Future<void> _showdialogbox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Take a Picture"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    onTap: () => _openGallery(),
                    child: Text("Open Galley"),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    onTap: () => _openCamera(),
                    child: Text("Open Camera"),
                  ),
                ],
              ),
            ),
          );
        });
  }

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
      bottomNavigationBar: new Container(
        color: orange,
        height: 50.0,
        alignment: Alignment.center,
        child: new BottomAppBar(
          color: orange,
          child: new Row(
            // alignment: MainAxisAlignment.spaceAround,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new IconButton(
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              new IconButton(
                icon: Icon(
                  Icons.add_box,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPost()),
                ),
              ),
              new IconButton(
                icon: Icon(
                  Icons.account_box,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfilePage()),
                ),
              ),
              new IconButton(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor:
                Colors.white, //This will change the drawer background to blue.
            //other styles
          ),
          child: Drawer(
              child: Column(children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[Colors.black, Colors.deepOrange])),
              accountName: Text(
                "Shoaib Salamat",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              accountEmail: Text(
                "bakhtawarhabib@gmail.com",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              currentAccountPicture: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/s.jpg"), fit: BoxFit.cover)),
              ),
              // currentAccountPicture: CircleAvatar(
              //   maxRadius: 70,
              //   minRadius: 65,
              //   backgroundColor: Colors.white,
              //   backgroundImage: AssetImage("assets/s.jpg"),
              // ),
            ),
            new ListTile(
              trailing: IconButton(
                  color: orange,
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    _signOut();
                  }),
              title: Text(
                "Logout",
                style: TextStyle(
                    color: orange, fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: orange,
              height: 10,
              thickness: 1,
            ),
            new ListTile(
              trailing: IconButton(
                color: orange,
                icon: Icon(Icons.settings),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                ),
              ),
              title: Text(
                "About",
                style: TextStyle(
                    color: orange, fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: orange,
              height: 10,
              thickness: 1,
            ),
          ]))),
      appBar: AppBar(
        iconTheme: new IconThemeData(color: orange),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          "assets/logoo.jpeg",
          height: 100,
          width: 200,
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Search()),
                ),
                child: Icon(
                  Icons.search,
                  color: orange,
                ),
              ))
        ],
      ),
      body: Stories(),

      // Flexible(
      //   child: Stories(),
      // )
    );
  }
}
