//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
//import 'package:crud_firebase/auth.dart';
import 'package:flutter/material.dart';

//import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prak_ppl/ui/dokter/dashboardDokter.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';

class DokterSignIn extends StatefulWidget {
  DokterSignIn({this.app});
  final FirebaseApp app;

  @override
  _DokterSignInState createState() => _DokterSignInState();
}

class _DokterSignInState extends State<DokterSignIn> {
  //final AuthService _auth = AuthService() ;

  String email = '';
  String password = '';
  String nama = '';
  String alergi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text('Login Dokter'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            child: Column(children: <Widget>[
          SizedBox(height: 20.0),
          TextFormField(
            onChanged: (val) {
              setState(() => nama = val);
            },
            decoration: InputDecoration(labelText: 'Nama'),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            onChanged: (val) {
              setState(() => email = val);
            },
            decoration: InputDecoration(labelText: 'email'),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            onChanged: (val) {
              setState(() => alergi = val);
            },
            decoration: InputDecoration(labelText: 'alergi'),
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
            child: Text('Login Dokter', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardDokter()),
              );
            },
          ),
        ])),
      ),
    );
  }
}
