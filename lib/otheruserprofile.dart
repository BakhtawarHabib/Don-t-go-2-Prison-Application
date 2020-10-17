import 'dart:ui';

import 'package:design_app/Followers.dart';
import 'package:design_app/Following.dart';

import 'package:flutter/material.dart';

final Color orange = Color(0XFFd45a29);

class OtherUserProfilePage extends StatefulWidget {
  OtherUserProfilePage({Key key}) : super(key: key);

  @override
  _OtherUserProfilePageState createState() => _OtherUserProfilePageState();
}

List images = [
  "assets/4.jpg",
  "assets/f.jpg",
  "assets/s.jpg",
  "assets/t.jpg",
  "assets/t.jpg",
  "assets/t.jpg",
  "assets/t.jpg",
  "assets/t.jpg",
  "assets/t.jpg",
  "assets/t.jpg",
  "assets/t.jpg",
  "assets/t.jpg",
  "assets/t.jpg",
  "assets/t.jpg",
  "assets/t.jpg",
  "assets/t.jpg",
  "assets/t.jpg",
  "assets/t.jpg",
];

class _OtherUserProfilePageState extends State<OtherUserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: orange),
        title: Text(
          "About",
          style: TextStyle(color: orange),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(5.0),
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            "*Don't go 2 prison initiative and brand is to deter Black Youth from going to prison",
            style: TextStyle(color: orange, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 450),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                SlideTransition(
              child: child,
              position:
                  Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                      .animate(animation),
            ),
            child: HeaderSection(),
          ),
          SizedBox(height: 40),
          Container(
            color: Colors.white,
            child: Wrap(
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      setState(() {});
                    },
                    child: SizedBox(
                      height: 400,
                      child: GridView.builder(
                        itemCount: images.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  images[index],
                                ),
                              ),
                              borderRadius: BorderRadius.circular(15.0)),
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.all(5.0),
                        ),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HeaderSection extends StatefulWidget {
  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: orange, width: 3.0),
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0)),
      height: 330,
      width: 350,
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                  image: AssetImage("assets/t.jpg"), fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Santoriya Alex",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 24, color: Colors.red),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "200",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: orange),
                    ),
                    Text(
                      'Post',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.redAccent),
                    )
                  ],
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Followers()),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Text(
                          "120K",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: orange),
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.redAccent),
                        )
                      ],
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Following()),
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Text(
                          "900",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: orange),
                        ),
                        Text(
                          'Following',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.redAccent),
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          MaterialButton(
            minWidth: 150,
            height: 50,
            shape: StadiumBorder(),
            color: orange,
            onPressed: () {
              setState(() {
                ispressed = !ispressed;
              });
            },
            child: (ispressed)
                ? Text(
                    "Follow",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                : Text(
                    "Following",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
          )
        ],
      ),
    );
  }
}
