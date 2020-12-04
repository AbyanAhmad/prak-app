//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
//import 'package:crud_firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:prak_ppl/ui/dokter/login.dart';
import 'package:prak_ppl/ui/pasien/dashboardPasien.dart';
import 'package:prak_ppl/ui/pasien/login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';

class Register extends StatefulWidget {
  Register({this.app});
  final FirebaseApp app;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //final AuthService _auth = AuthService() ;

  String email = '';
  String password = '';
  String nama = '';
  String alergi = '';

  DatabaseReference _userRef;

  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    _userRef = database.reference().child('User');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text('Register Pasien'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: Form(
            child: Column(children: <Widget>[
          Divider(),
          TextFormField(
            onChanged: (val) {
              setState(() => nama = val);
            },
            decoration: InputDecoration(labelText: 'Nama'),
          ),
          Divider(),
          TextFormField(
            onChanged: (val) {
              setState(() => email = val);
            },
            decoration: InputDecoration(labelText: 'Email'),
          ),
          Divider(),
          TextFormField(
            onChanged: (val) {
              setState(() => alergi = val);
            },
            decoration: InputDecoration(labelText: 'Alergi'),
          ),
          Divider(),
          TextFormField(
            obscureText: true,
            onChanged: (val) {
              setState(() => password = val);
            },
            decoration: InputDecoration(labelText: 'Password'),
          ),
          Divider(),
          RaisedButton(
            color: Colors.green,
            child: Text('Daftar', style: TextStyle(color: Colors.white)),
            onPressed: () {
              _userRef.push().set(<String, String>{
                "Nama": "" + nama,
                "Email": "" + email,
                "Alergi": "" + alergi,
                "Password": "" + password,
              });
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DashboardPasien()));
            },
          ),
          Divider(),
          RaisedButton(
            color: Colors.green,
            child: Text('Login Dokter', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DokterSignIn()));
            },
          ),
          Divider(),
          RaisedButton(
            color: Colors.green,
            child: Text('Login Pasien', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInUser()));
            },
          ),
        ])),
      ),
    );
  }
}
