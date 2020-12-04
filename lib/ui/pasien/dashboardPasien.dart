import 'package:flutter/material.dart';
import 'package:prak_ppl/ui/pasien/tambahMakanan.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';

class DashboardPasien extends StatefulWidget {
  DashboardPasien({this.app});
  final FirebaseApp app;
  @override
  _DashboardPasienState createState() => _DashboardPasienState();
}

class _DashboardPasienState extends State<DashboardPasien> {
  final referenceDatase = FirebaseDatabase.instance;
  final movieName = 'MovieTitle';
  final movieController = TextEditingController();
  final dbRef = FirebaseDatabase.instance.reference().child("Makanan");
  List<Map<dynamic, dynamic>> lists = [];

  //DatabaseReference _moviesRef;
  @override
  void initState() {
    //final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    //_moviesRef = database.reference().child('Makanan');
    super.initState();
  }

  /*List<String> namaMakanan = <String>[
    'Nasi Goreng Seafood',
    'Indomie Ayam Bawang',
    'Soto Ayam'
  ];
  List<String> deskripsi = <String>[
    'Tidak aman, mengandung bahan pantangan/alergi',
    'Aman',
    'Aman'
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[700],
          title: const Text('Riwayat Makan'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.account_circle), onPressed: null)
          ]),
      body: Column(children: [
        FutureBuilder(
            future: dbRef.once(),
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                lists.clear();
                Map<dynamic, dynamic> values = snapshot.data.value;
                values.forEach((key, values) {
                  lists.add(values);
                });
                return new ListView.builder(
                    shrinkWrap: true,
                    itemCount: lists.length,
                    itemBuilder: (BuildContext context, int index) {
                      final number = index + 1;
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                              leading: Text(number.toString()),
                              title: Text(lists[index]["nama"],
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Color(0xFF252424),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal))),
                            )
                          ],
                        ),
                      );
                    });
              }
              return CircularProgressIndicator();
            })
      ]),
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
