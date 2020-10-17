import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

final Color orange = Color(0XFFd45a29);

class AddPost extends StatefulWidget {
  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: orange),
          centerTitle: true,
          title: Text(
            "Add Post",
            style: TextStyle(color: orange),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      "Don't Go 2 Prison Go ",
                      style: TextStyle(
                          color: orange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    new Theme(
                        data: new ThemeData(
                          primaryColor: Colors.red,
                          primaryColorDark: orange,
                        ),
                        child: SingleChildScrollView(
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: orange)),
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: new InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: orange)),
                                    hintText: "Add  Caption",
                                    hintStyle: TextStyle(
                                        color: orange,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  minLines: 1,
                                  maxLines: 15,
                                  style: new TextStyle(
                                    color: orange,
                                    fontFamily: "Poppins",
                                  ),
                                )))),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: orange, width: 2),
                            borderRadius: BorderRadius.circular(20.0)),
                        width: 300,
                        height: 300,
                        margin: EdgeInsets.all(20.0),
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add Picture",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: orange),
                            ),
                            IconButton(
                                alignment: Alignment.bottomLeft,
                                icon: Icon(
                                  Icons.camera_enhance,
                                  color: orange,
                                  size: 40,
                                ),
                                onPressed: () {
                                  _showdialogbox(context);
                                })
                          ],
                        )),
                    MaterialButton(
                      minWidth: 200,
                      height: 50,
                      shape: StadiumBorder(),
                      color: orange,
                      onPressed: () {},
                      child: Text(
                        "Post",
                        style: new TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  ],
                ))));
  }
}
