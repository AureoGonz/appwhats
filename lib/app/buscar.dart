import 'package:flutter/material.dart';

class Buscar extends StatefulWidget {
  const Buscar({this.email}) : super();
  final String email;
  @override
  _BuscarState createState() => _BuscarState(email);
}

class _BuscarState extends State<Buscar> {
  _BuscarState(this.email);
  final String email;
  final txtBuscar = TextEditingController();

  @override
  void initState() {
    super.initState();
    print(email);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 200, 0, 25),
        title: Padding(
          padding: const EdgeInsets.only(left: 8, top:10, bottom: 10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
              hintText:'Buscar',hintStyle: TextStyle(fontSize: 20)
            ),
            controller: txtBuscar,
          ),
        ),
        actions: <Widget>[
          RaisedButton(
            child: Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
