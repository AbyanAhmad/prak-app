//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
//import 'package:crud_firebase/auth.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  //final AuthService _auth = AuthService() ;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text('Login Pasien'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            child: Column(children: <Widget>[
          SizedBox(height: 20.0),
          TextFormField(
            onChanged: (val) {
              setState(() => email = val);
            },
            decoration: InputDecoration(labelText: 'Nama'),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            obscureText: true,
            onChanged: (val) {
              setState(() => password = val);
            },
            decoration: InputDecoration(labelText: 'Password'),
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            color: Colors.green,
            child: Text('Daftar', style: TextStyle(color: Colors.white)),
            onPressed: () async {},
          ),
        ])),
      ),
    );
  }
}
