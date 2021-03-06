import 'dart:io';

import 'package:design_app/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final Color orange = Color(0XFFd45a29);

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Future _uploadImage() async {
    StorageReference reference =
        FirebaseStorage.instance.ref().child("myimage.png");
    StorageUploadTask uploadTask = reference.putFile(imagefile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
  }

  File imagefile;
  _openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imagefile = picture;
    });
  }

  bool _obscureText = true;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
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
                    onTap: () {
                      _openGallery();
                      Navigator.of(context).pop();
                    },
                    child: Text("Open Galley"),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    child: Text("Open Camera"),
                  ),
                ],
              ),
            ),
          );
        });
  }

  final _auth = FirebaseAuth.instance;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String email = "  ";
  String password = "  ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: orange),
          backgroundColor: Color(0xFF080808),
          title: Text(
            "Edit Your Profile",
            style: TextStyle(
              color: Color(0XFFd45a29),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color(0xFF080808),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                SizedBox(
                  height: 25.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    CircleAvatar(
                        backgroundColor: orange,
                        radius: 75,
                        child: CircleAvatar(
                          radius: 70,
                          child: ClipOval(
                            child: SizedBox(
                                height: 130.0,
                                width: 130.0,
                                child: (imagefile != null)
                                    ? Image.file(
                                        imagefile,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  AssetImage("assets/s.jpg")),
                                        ),
                                      )),
                          ),
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                        onTap: () {
                          _showdialogbox(context);
                        },
                        child: FlatButton.icon(
                            onPressed: () {
                              _showdialogbox(context);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: orange,
                            ),
                            label: Text(
                              "Edit Profle Picture",
                              style: TextStyle(color: orange, fontSize: 17),
                            ))),
                    imagefile == null
                        ? Text("")
                        : MaterialButton(
                            shape: StadiumBorder(),
                            color: orange,
                            onPressed: () {},
                            child: Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: new Theme(
                          data: new ThemeData(
                            primaryColor: Colors.black,
                            primaryColorDark: Colors.black,
                          ),
                          child: TextFormField(
                            controller: nameController,
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                              suffixIcon: Icon(
                                Icons.edit,
                                color: orange,
                              ),
                              hintText: "Name",
                              hintStyle: TextStyle(
                                color: orange,
                              ),
                              fillColor: orange,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                              //fillColor: Colors.green
                            ),
                            keyboardType: TextInputType.name,
                            style: new TextStyle(
                              color: orange,
                              fontFamily: "Poppins",
                            ),
                          )),
                    )),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: new Theme(
                          data: new ThemeData(
                            primaryColor: Colors.black,
                            primaryColorDark: Colors.black,
                          ),
                          child: TextFormField(
                            controller: ageController,
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                              suffixIcon: Icon(
                                Icons.edit,
                                color: orange,
                              ),
                              hintText: "Age",
                              hintStyle: TextStyle(
                                color: orange,
                              ),
                              fillColor: orange,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                              //fillColor: Colors.green
                            ),
                            validator: (val) {
                              if (val.length == 0) {
                                return "Email cannot be empty";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.number,
                            style: new TextStyle(
                              color: orange,
                              fontFamily: "Poppins",
                            ),
                          )),
                    )),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: new Theme(
                        data: new ThemeData(
                          primaryColor: Colors.black,
                          primaryColorDark: Colors.black,
                        ),
                        child: TextFormField(
                            controller: emailController,
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                              suffixIcon: Icon(
                                Icons.edit,
                                color: orange,
                              ),
                              hintText: "Enter Your Email",
                              hintStyle: TextStyle(
                                color: orange,
                              ),
                              fillColor: Color(0xFF88B5E9),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                              //fillColor: Colors.green
                            ),
                            validator: (val) {
                              if (val.length == 0) {
                                return "Email cannot be empty";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            style: new TextStyle(
                              color: orange,
                              fontFamily: "Poppins",
                            )),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: new Theme(
                          data: new ThemeData(
                            primaryColor: Colors.black,
                            primaryColorDark: Colors.black,
                          ),
                          child: TextFormField(
                            obscureText: _obscureText,
                            controller: passwordController,
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: _toggle,
                                  child: new Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: orange,
                                  )),

                              hintText: "Enter Your Password",
                              hintStyle: TextStyle(color: orange),
                              fillColor: orange,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                              //fillColor: Colors.green
                            ),
                            validator: (val) {
                              if (val.length == 0) {
                                return "Password cannot be empty";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            style: new TextStyle(
                              color: orange,
                              fontFamily: "Poppins",
                            ),
                          )),
                    )),
                MaterialButton(
                  shape: StadiumBorder(),
                  height: 50,
                  minWidth: 250,
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "Poppins"),
                  ),
                  color: orange,
                ),
                SizedBox(
                  height: 10.0,
                ),
              ]),
            )));
  }
}
