import 'package:flutter/material.dart';

class DashboardPasien extends StatefulWidget {
  @override
  _DashboardPasienState createState() => _DashboardPasienState();
}

class _DashboardPasienState extends State<DashboardPasien> {
  List<String> namaMakanan = <String>[
    'Nazi Goyeng',
    'Es teh anget',
    'Steak babi halal'
  ];
  List<String> deskripsi = <String>[
    'sieg heil',
    'Ngilu njir',
    'Mana bisa gitu'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[700],
          title: const Text('Riwayat Makan'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.account_circle), onPressed: null)
          ]),
      body: ListView.builder(
          itemCount: namaMakanan.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                title: Text('${namaMakanan[index]}'),
                subtitle: Text('${deskripsi[index]}'),
              ),
            ]));
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[700],
        onPressed: (null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
