import 'package:flutter/material.dart';
import 'package:prak_ppl/ui/tambahMakanan.dart';

class DashboardPasien extends StatefulWidget {
  @override
  _DashboardPasienState createState() => _DashboardPasienState();
}

class _DashboardPasienState extends State<DashboardPasien> {
  List<String> namaMakanan = <String>[
    'Nasi Goreng Seafood',
    'Indomie Ayam Bawang',
    'Soto Ayam'
  ];
  List<String> deskripsi = <String>[
    'Tidak aman, mengandung bahan pantangan/alergi',
    'Aman',
    'Aman'
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
            final number = index + 1;
            return Card(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                leading: Text(number.toString()),
                title: Text('${namaMakanan[index]}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${deskripsi[index]}'),
              ),
            ]));
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[700],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahMakanan()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
