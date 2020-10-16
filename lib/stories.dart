import 'package:design_app/Commentsection.dart';
import 'package:design_app/home.dart';
import 'package:design_app/searchscreen.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

final Color orange = Color(0XFFd45a29);

class Stories extends StatefulWidget {
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    List images = [
      "assets/4.jpg",
      "assets/f.jpg",
      "assets/s.jpg",
      "assets/t.jpg",
      "assets/t.jpg"
    ];
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: images.length,
      itemBuilder: (context, index) => Container(
          color: Colors.black,
          width: double.infinity,
          height: 790,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new AssetImage(images[index]))),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Shoaib Salamat",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    Text(
                      "Posted 2 days ago",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Don't go 2 prison go 2 play basketball",
                      style: TextStyle(color: orange, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Image.asset(
                images[index],
                fit: BoxFit.fitWidth,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: orange.withOpacity(0.5))),
                height: 80.0,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width: 5.0,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "123k Likes                                       ",
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.start,
                        ),
                        FlatButton.icon(
                            onPressed: () {
                              setState(() {
                                isPressed = !isPressed;
                              });
                            },
                            icon: (isPressed)
                                ? Icon(
                                    Icons.favorite_rounded,
                                    color: orange,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color: orange,
                                  ),
                            label: (isPressed)
                                ? Text(
                                    "Liked",
                                    style: TextStyle(color: orange),
                                  )
                                : Text(
                                    "Like",
                                    style: TextStyle(color: orange),
                                  )),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "             2003 comments",
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.start,
                        ),
                        FlatButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (CommentSection())),
                              );
                            },
                            icon: Icon(
                              Icons.comment,
                              color: orange,
                            ),
                            label: Text(
                              "Comment",
                              style: TextStyle(color: orange),
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
