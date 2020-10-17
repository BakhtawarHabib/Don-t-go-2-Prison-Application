import 'package:design_app/otheruserprofile.dart';
import 'package:flutter/material.dart';

final Color orange = Color(0XFFd45a29);

class Following extends StatefulWidget {
  @override
  _FollowingState createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Following",
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
