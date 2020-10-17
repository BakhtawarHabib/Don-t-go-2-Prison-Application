import 'dart:ui';

import 'package:flutter/material.dart';

import 'otheruserprofile.dart';

final Color orange = Color(0XFFd45a29);

class Followers extends StatefulWidget {
  @override
  _FollowersState createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Followers",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: orange,
        ),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 4,
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OtherUserProfilePage()),
                  );
                },
                child: ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage(images[index]))),
                    ),
                    title: Text(
                      "Sentoriya Alex",
                      style: TextStyle(
                          color: orange,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: MaterialButton(
                      shape: StadiumBorder(),
                      minWidth: 130,
                      height: 40,
                      onPressed: () {
                        setState(() {
                          ispressed = !ispressed;
                        });
                      },
                      child: (ispressed)
                          ? Text(
                              "Follow",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )
                          : Text(
                              "Following",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                      color: orange,
                    )))));
  }
}
