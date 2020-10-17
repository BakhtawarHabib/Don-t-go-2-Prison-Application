import 'dart:ui';

import 'package:design_app/otheruserprofile.dart';
import 'package:flutter/material.dart';

final Color orange = Color(0XFFd45a29);

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: new IconThemeData(color: orange),
          title: Container(
            height: 50,
            decoration: BoxDecoration(
              color: orange,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: new Theme(
                data: new ThemeData(
                  primaryColor: Colors.redAccent,
                  primaryColorDark: Colors.redAccent,
                ),
                child: TextField(
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    fillColor: Colors.black,
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(),
                        borderRadius: BorderRadius.circular(25.0)),
                    //fillColor: Colors.green
                  ),
                )),
          ),
          backgroundColor: Colors.white,
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
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/t.jpg"),
                          fit: BoxFit.cover)),
                ),
                title: Text(
                  "Sentoriya Alex",
                  style: TextStyle(color: orange, fontSize: 18),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: orange,
                  ),
                  onPressed: () {},
                ),
              )),
        ));
  }
}
