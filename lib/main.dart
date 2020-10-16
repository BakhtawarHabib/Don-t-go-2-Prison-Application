import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:design_app/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status = prefs.getBool('isLoggedIn') ?? false;
  print(status);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: status == true ? MyHomePage() : Splashscreen(),
  ));
}

final Color orange = Color(0XFFd45a29);

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Image.asset(
                "assets/logoo.jpeg",
                height: 200,
              ),
            )),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "The Purpose of the Don't Go 2 Prison \nInitiative is to deter Black youth from going to prison.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: orange, fontSize: 15, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 60,
            ),
            Text(
              "Founded by Attorney Mohammed S. Luwemba",
              style: TextStyle(
                  color: orange, fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ));
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final _auth = FirebaseAuth.instance;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String email = "  ";
  String password = "  ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF080808),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: 80.0,
                  ),
                  Text(
                    "Login Here!!",
                    style: TextStyle(
                      color: Color(0XFFd45a29),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    "assets/logoo.jpeg",
                    height: 200,
                    width: 200,
                  ),
                  Padding(
                      padding: EdgeInsets.all(30.0),
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
                                hintText: "Enter Your Email",
                                hintStyle: TextStyle(
                                  color: Color(0XFFd45a29),
                                ),
                                fillColor: Color(0XFFd45a29),
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
                                color: Colors.black,
                                fontFamily: "Poppins",
                              ),
                            )),
                      )),
                  Padding(
                      padding: EdgeInsets.all(30.0),
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
                                    child: new Icon(_obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility)),

                                hintText: "    Enter Your Password",
                                hintStyle: TextStyle(color: Color(0XFFd45a29)),
                                fillColor: Color(0XFFd45a29),
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
                                color: Colors.black,
                                fontFamily: "Poppins",
                              ),
                            )),
                      )),
                  MaterialButton(
                    shape: StadiumBorder(),
                    height: 50,
                    minWidth: 250,
                    onPressed: () async {
                      try {
                        AuthResult result =
                            await _auth.signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);

                        if (result != null) {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs?.setBool("isLoggedIn", true);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Poppins"),
                    ),
                    color: Color(0XFFd45a29),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text("Create Your Account Here",
                        style:
                            TextStyle(color: Color(0XFFd45a29), fontSize: 18)),
                  )
                ],
              ),
            )));
  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
  final _formKey = GlobalKey<FormState>();
  String email = "  ";
  String password = "  ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF080808),
          title: Text(
            "Create Your Account",
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
              child: Column(
                children: [
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
                          radius: 55,
                          child: CircleAvatar(
                            radius: 50,
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
                                          color: Colors.black,
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
                                Icons.picture_in_picture_alt,
                                color: orange,
                              ),
                              label: Text(
                                "Upload Profle Picture",
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
                              textAlign: TextAlign.center,
                              decoration: new InputDecoration(
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
                              validator: (val) {
                                if (val.length == 0) {
                                  return "Email cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: new TextStyle(
                                color: Colors.black,
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
                              textAlign: TextAlign.center,
                              decoration: new InputDecoration(
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
                              style: new TextStyle(
                                color: Colors.black,
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
                              style: new TextStyle(
                                color: Colors.black,
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
                                    child: new Icon(_obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility)),

                                hintText: "Enter Your Password",
                                hintStyle: TextStyle(color: orange),
                                fillColor: orange,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(),
                                ),
                                //fillColor: Colors.green
                              ),
                              style: new TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                              ),
                            )),
                      )),
                  MaterialButton(
                    shape: StadiumBorder(),
                    height: 50,
                    minWidth: 250,
                    onPressed: () async {
                      try {
                        AuthResult result =
                            await _auth.createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);

                        if (result != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Poppins"),
                    ),
                    color: orange,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text("Already have a Account",
                        style: TextStyle(color: orange, fontSize: 18)),
                  )
                ],
              ),
            )));
  }
}
