import 'package:contactobloc/bloc/persona_bloc.dart';
import 'package:contactobloc/page/persona_pages.dart';
import 'package:contactobloc/resource/db_provider.dart';
import 'package:flutter/material.dart';

class PersonaHome extends StatefulWidget {


  @override
  _PersonaHomeState createState() => _PersonaHomeState();
}

class _PersonaHomeState extends State<PersonaHome> {

  final persoBloc = new PersonaBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _barraTitulo(),
      body: PersonaPage(),
    );
  }

  Widget _barraTitulo(){

    return AppBar(
      centerTitle: true,
      title: Text('Contacto', style: TextStyle(fontSize: 18.0),),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.edit),//TODO: Lo que rescate
          onPressed: () => Navigator.pushNamed(context, 'registro'),
          // {
          //   final scan = PersonaModel(nombre: "Erick", apellido: "Martinez",email: "drag@gmail.com",birthday: "13/09/94",sexo: "M");
          //   persoBloc.agregarContacto(scan);
          // }
        )
      ],
    );

  }
}