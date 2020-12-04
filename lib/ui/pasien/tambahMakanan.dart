import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class TambahMakanan extends StatefulWidget {
  TambahMakanan({this.app});
  final FirebaseApp app;
  @override
  _TambahMakananState createState() => _TambahMakananState();
}

class _TambahMakananState extends State<TambahMakanan> {
  TextEditingController nameController = TextEditingController();
  String namaMakanan = '';
  final referenceDatase = FirebaseDatabase.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ref = referenceDatase.reference();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[700],
            title: Text('Tambah Riwayat Makan'),
            automaticallyImplyLeading: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context, false)),
          ),
          body: Center(
              child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama Makanan',
                  ),
                  onChanged: (text) {
                    setState(() {
                      namaMakanan = text;
                    });
                  },
                )),
            RaisedButton(
              child: Text('Tambah'),
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              onPressed: () {
                ref
                    .child('Makanan')
                    .push()
                    .child('nama')
                    .set(namaMakanan)
                    .asStream();
                nameController.clear();
              },
            ),
          ]))),
    );
  }
}
