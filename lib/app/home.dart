import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'buscar.dart';

final db = Firestore.instance;

class Home extends StatefulWidget {
  const Home({Key key, this.user, this.email}) : super(key: key);
  final FirebaseUser user;
  final String email;
  @override
  _HomeState createState() => _HomeState(user);
}

class _HomeState extends State<Home> {
  _HomeState(this.user);
  final FirebaseUser user;
  var usuario;
  var usaurio = '';

  @override
  void initState() {
    super.initState();
    print(user.email);
    db
        .collection('appwhats_users')
        .where('email', isEqualTo: user.email)
        .getDocuments()
        .then((QuerySnapshot docs) {
          setState(() {
      usuario = docs.documents[0].data;
      usaurio = usuario['alias'];
      print(usaurio);
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 200, 0, 25),
        title: Text('AppWhats $usaurio'),
      ),
      body: Container(
        child: Text('Hola')//ListView(
        // children: cargarChats(),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 200, 0, 25),
        child: Icon(Icons.message,color: Colors.white),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Buscar(email: usuario['email']), fullscreenDialog: true));
        },
      ),
    );
  }
}
