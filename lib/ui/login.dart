import 'package:flutter/material.dart';





class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  PostResult login;
  DialogBox dialogBox;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  void initState() {
    super.initState();
    Hive.registerAdapter(
      UserDataAdapter(),
    );
    _openBox();
  }

  Future _openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    return;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: getSmallDiameter(context) / 7,
            top: getSmallDiameter(context) / 3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Car.car_solid,
                    size: 40,
                  ),
                  Text("COWZY",
                      style: TextStyle(
                          color: Color(0xFFFFF7B81E), fontSize: 20.0)),
                ],
              ),
              width: getSmallDiameter(context) / 1.4,
              height: getSmallDiameter(context) / 1.4,
              decoration: new BoxDecoration(
                borderRadius:
                    new BorderRadius.circular(getSmallDiameter(context) / 2),
                border: new Border.all(
                  width: 10.0,
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: <Widget>[
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  margin: EdgeInsets.fromLTRB(20, 350, 20, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        onChanged: (phone) {
                          setState(() {});
                        },
                        controller: phoneNumber,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF818181)),
                          ),
                          labelText: "Email/No.Telepon : ",
                          labelStyle: TextStyle(
                              color: Color(0xFFFF818181), letterSpacing: 2.0),
                        ),
                      ),
                      TextField(
                        onChanged: (passw) {
                          setState(() {});
                        },
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF818181)),
                          ),
                          labelText: "Password: ",
                          labelStyle: TextStyle(
                              color: Color(0xFFFF818181), letterSpacing: 2.0),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.85,
                    height: 48.0,
                    elevation: 2.0,
                    //child: RaisedButton(
                    color: Color(0xFFFFF7B81E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    onPressed: () {
                      PostResult.connectToApI(phoneNumber.text, password.text)
                          .then((value) {
                        login = value;
                        setState(() async {
                          if (login.message == null) {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: Home(), type: PageTransitionType.fade),
                            ) ;
                            var userDataBox = Hive.box("UserData");
                            userDataBox.add(UserData(phoneNumber.toString(), 1));
                          } else {
                            await DialogBox.showCustomAlertBox(
                                context: context,
                                firstButton: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  color: Colors.white,
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                yourWidget: Container(
                                  child: Text(login.message),
                                ));
                          }
                        });
                      });
                    },
                    child: Text(
                      "LOGIN",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    //),
                  ),
                ),
                SizedBox(height: 24),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Belum punya akun ?\n",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Daftar",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                              context,
                              PageTransition(
                                  child: UserRegister(),
                                  type:
                                      PageTransitionType.rightToLeftWithFade)),
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            color: Color(0xFFFFF7B81E),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        // ),
      ),
    );
  }
}
