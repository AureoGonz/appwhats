import 'package:flutter/material.dart';
import 'package:screen/screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = Firestore.instance;

Future main() async {
  Screen.keepOn(true);
  runApp(new Nube());
}

class Nube extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Estado();
  }
}

class _Estado extends State {
  final txtMensaje = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Servicios en la nube'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'escribe un mensaje',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              ),
              controller: txtMensaje,
            ),
            RaisedButton(
              child: Text('eliminar'),
              onPressed: () {
                eliminar();
              },
            ),
            RaisedButton(
              child: Text('actualizar'),
              onPressed: () {
                actualizar();
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          onPressed: () {
            setState(() {
              insertar(txtMensaje.text);
            });
          },
        ),
      ),
    );
  }
}

void insertar(String mensaje) async {
  await db.collection('appwhats').add({'mensaje': mensaje});
}

void eliminar() async {
  await db.collection('appwhats').document('').delete();
}

void actualizar() async {
  await db
      .collection('appwhats')
      .document('-LuKrrfmsATB9Lay8HxM')
      .updateData({'mensaje': 'Adios'});
}
