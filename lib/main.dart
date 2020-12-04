import 'package:flutter/material.dart';
import 'package:prak_ppl/ui/pasien/dashboardPasien.dart';
import 'package:prak_ppl/ui//dokter/dashboardDokter.dart';
import 'package:prak_ppl/ui/pasien/login.dart';
import 'package:prak_ppl/ui/pasien/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Register(),
    );
  }
}
