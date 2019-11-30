import 'package:extra/bienvenido/login/login.dart';
import 'package:extra/bienvenido/login/singup.dart';
import 'package:flutter/material.dart';

class Bienvenido extends StatefulWidget {
  @override
  _BienvenidoState createState() => _BienvenidoState();
}

class _BienvenidoState extends State<Bienvenido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 200, 0, 25),
        title: Text('Esto no es Whatsapp'),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                color: Colors.redAccent,
                elevation: 100,
                child: Container(
                  padding: EdgeInsets.all(40),
                  child: Align(
                    child: Text(
                      'AppWhats',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                margin: EdgeInsets.all(20),
              ),
              RaisedButton(
                color: Color.fromARGB(250, 200, 0, 25),
                child: Text('Iniciar Sesion'),
                onPressed: irLogin,
              ),
              RaisedButton(
                color: Color.fromARGB(125, 200, 0, 25),
                child: Text('Registrate'),
                onPressed: irSignup,
              )
            ],
          ),
        ),
      ),
    );
  }

  void irLogin(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
  }

  void irSignup(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Signup()));
  }
}
