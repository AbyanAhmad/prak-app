import 'package:flutter/material.dart';
import 'package:prak_ppl/ui/tambahPasien.dart';

class DashboardDokter extends StatefulWidget {
  @override
  _DashboardDokterState createState() => _DashboardDokterState();
}

class _DashboardDokterState extends State<DashboardDokter> {
  List<String> namaPasien = <String>['Sutarno', 'Paijo', 'Paimin'];
  List<String> alergi = <String>[
    'Alergi Udang',
    'Alergi Jengkol',
    'Alergi Nanas'
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
            final number = index + 1;
            return Card(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                leading: Text(number.toString()),
                title: Text('${namaPasien[index]}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${alergi[index]}'),
              ),
            ]));
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[700],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahPasien()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
