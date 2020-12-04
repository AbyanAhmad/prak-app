//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
//import 'package:crud_firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:prak_ppl/ui/pasien/dashboardPasien.dart';

class SignInUser extends StatefulWidget {
  @override
  _SignInUserState createState() => _SignInUserState();
}

class _SignInUserState extends State<SignInUser> {
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
            child: Text('Login Pasien', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardPasien()));
            },
          ),
        ])),
      ),
    );
  }
}
