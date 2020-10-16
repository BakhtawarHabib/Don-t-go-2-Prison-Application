import 'package:flutter/material.dart';

final Color orange = Color(0XFFd45a29);

class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
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

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text(
          "About",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: orange,
      ),
      backgroundColor: Colors.black,
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
            color: Colors.black,
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

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: orange, width: 3.0),
          color: Colors.black,
          borderRadius: BorderRadius.circular(25.0)),
      height: 320,
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
                  image: AssetImage("assets/s.jpg"), fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Shoaib Salamat",
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
                      "4",
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
                Column(
                  children: <Widget>[
                    Text(
                      "12K",
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
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "400",
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
