import 'package:flutter/material.dart';

class DashboardDokter extends StatefulWidget {
  @override
  _DashboardDokterState createState() => _DashboardDokterState();
}

class _DashboardDokterState extends State<DashboardDokter> {
  List<String> namaPasien = <String>['Sutarno', 'Paijo', 'Paimin'];
  List<String> alergi = <String>[
    'Alergi udara',
    'Alergi matahari',
    'Alegi wnita'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[700],
          title: const Text('Daftar Pasien'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.account_circle), onPressed: null)
          ]),
      body: ListView.builder(
          itemCount: namaPasien.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                title: Text('${namaPasien[index]}'),
                subtitle: Text('${alergi[index]}'),
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
