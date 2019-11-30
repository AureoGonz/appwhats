import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:screen/screen.dart';

import 'login.dart';

final db = Firestore.instance;

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password, _alias, error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 200, 0, 25),
        title: Text('Registro de usuario'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        margin: EdgeInsets.only(top: 30),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text('$error', style: TextStyle(color: Colors.redAccent, fontSize: 15),),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Necesitas un alias';
                    }
                  },
                  decoration: InputDecoration(labelText: 'Alias'),
                  onSaved: (input) => _alias = input,
                ),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Necesito un email';
                    }
                  },
                  decoration: InputDecoration(labelText: 'Correo electronica'),
                  onSaved: (input) => _email = input,
                ),
                TextFormField(
                  validator: (input) {
                    if (input.length < 6) {
                      return 'Contraseña muy corta';
                    }
                  },
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  onSaved: (input) => _password = input,
                  obscureText: true,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    onPressed: (){
                      setState(() {
                        signUp();
                      });
                    },
                    child: Text('Registrar'),
                    color: Color.fromARGB(250, 200, 0, 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        db
            .collection('appwhats_users')
            .where('email', isEqualTo: _email)
            .getDocuments()
            .then((QuerySnapshot docs) async {
          if (docs.documents.isNotEmpty) {
            print('ta lleno');
            print(docs.documents[0].data);
            error = 'El correo ya ha sido registrado';
          } else {
            print('no ta lleno');
            error = '';
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: _email, password: _password);
            await db
                .collection('appwhats_users')
                .add({'alias': _alias, 'email': _email});
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Login()));
          }
        });
      } catch (e) {
        print(e.message);
      }
    }
  }
}
