
import 'dart:async';

import 'package:contactobloc/model/persona_model.dart';
import 'package:contactobloc/resource/db_provider.dart';

class PersonaBloc{

  static final PersonaBloc _singleton = new PersonaBloc._internal();
  //singleton sera mi objeo de mi propia clase que a su vez llama al metodo internal 

  factory PersonaBloc(){
    return _singleton;
  } //queda atento a la construccion a la invocacion de un objeto PersonaBloc

//Entonces cuando singleton se dispara llama a obtenerPersona
  PersonaBloc._internal(){
    obtenerPersonas();
  }

  //queta atento y escuchando
  final _personaController = StreamController<List<PersonaModel>>.broadcast(); 

  dispose(){
    _personaController?.close();
  } //Si ya no esta saliendo datos o activo que se cierre el flujo de salida

  //El tipo de datos que fluira 
  Stream<List<PersonaModel>> get personaStream => _personaController.stream;

  obtenerPersonas() async{

    _personaController.sink.add( await DBProvider.db.getTodoPerson());

  }

  agregarContacto( PersonaModel persona ) async{

    await DBProvider.db.nuevoContacto(persona);
    obtenerPersonas();

  }

  borarPersona( int id ) async{

    await DBProvider.db.deletePersona(id);
    obtenerPersonas();

  }



}