import 'package:contactobloc/page/persona_home.dart';
import 'package:contactobloc/page/persona_registro.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Contactos ',
      initialRoute: 'home',
      routes: {
        'home'      : (BuildContext context) => PersonaHome(),
        'registro'  : (BuildContext context) => PersonaRegistro(),
      },
      theme: ThemeData(
        primaryColor: Colors.purpleAccent
      ),
     
    );
  }
}