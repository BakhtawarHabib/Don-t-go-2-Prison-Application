import 'dart:ui';

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
      backgroundColor: Colors.black,
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
                primaryColor: Colors.black,
                primaryColorDark: Colors.black,
              ),
              child: TextField(
                decoration: new InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  fillColor: Colors.black,
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
              )),
        ),
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (context, index) => ListTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/s.jpg"),
                          fit: BoxFit.cover)),
                ),
                title: Text(
                  "Shoaib Salamat",
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
    );
  }
}
