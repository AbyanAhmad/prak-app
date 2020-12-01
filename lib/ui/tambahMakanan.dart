import 'package:flutter/material.dart';

class TambahMakanan extends StatefulWidget {
  @override
  _TambahMakananState createState() => _TambahMakananState();
}

class _TambahMakananState extends State<TambahMakanan> {
  TextEditingController nameController = TextEditingController();
  String namaMakanan = '';

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
            ),
          ]))),
    );
  }
}
