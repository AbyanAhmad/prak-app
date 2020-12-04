//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
//import 'package:crud_firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:prak_ppl/ui/dokter/dashboardDokter.dart';
import 'package:prak_ppl/ui/dokter/login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';

class RegisterDokter extends StatefulWidget {
  RegisterDokter({this.app});
  final FirebaseApp app;

  @override
  _RegisterDokterState createState() => _RegisterDokterState();
}

class _RegisterDokterState extends State<RegisterDokter> {
  //final AuthService _auth = AuthService() ;

  String email = '';
  String password = '';
  String nama = '';

  DatabaseReference _userRef;

  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    _userRef = database.reference().child('Dokter');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text('Register Dokter'),
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
                "Password": "" + password,
              });
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DashboardDokter()));
            },
          ),
        ])),
      ),
    );
  }
}
