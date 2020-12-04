import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prak_ppl/ui/dokter/tambahPasien.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:prak_ppl/ui/pasien/dashboardPasien.dart';

class DashboardDokter extends StatefulWidget {
  DashboardDokter({this.app});
  final FirebaseApp app;
  @override
  _DashboardDokterState createState() => _DashboardDokterState();
}

class _DashboardDokterState extends State<DashboardDokter> {
  final referenceDatase = FirebaseDatabase.instance;
  final dbRef = FirebaseDatabase.instance.reference().child("User");
  List<Map<dynamic, dynamic>> lists = [];

  //DatabaseReference _moviesRef;
  @override
  void initState() {
    //final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    //_moviesRef = database.reference().child('Makanan');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[700],
          title: const Text('Daftar Pasien'),
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
                      return Card(
                        child: new InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardPasien()));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                              leading : Text("Nama: " + lists[index]["name"],
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Color(0xFF252424),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal))),
                              title : Text("Alergi: " + lists[index]["alergi"],
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Color(0xFF252424),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal))),)
                            ],
                          ),
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
            MaterialPageRoute(builder: (context) => TambahPasien()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
