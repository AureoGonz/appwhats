import 'package:extra/app/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 200, 0, 25),
        title: Text('Iniciar Sesion'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        margin: EdgeInsets.only(top: 30),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
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
                    onPressed: signIn,
                    child: Text('Entrar'),
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
  void signIn() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password));
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user, email: _email), fullscreenDialog: true));
      }catch(e){
        print(e.message);
      }
    }
  }
}
