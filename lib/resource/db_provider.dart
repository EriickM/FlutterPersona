import 'dart:io';

import 'package:contactobloc/model/persona_model.dart';
export 'package:contactobloc/model/persona_model.dart';

import 'package:path_provider/path_provider.dart'; //Directory
import 'package:sqflite/sqflite.dart';  // Base de datos
import 'package:path/path.dart';

class DBProvider{

  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async{

    if( _database != null ) return _database;
    _database = await crearBase();
    return _database;  //retorna una base de datos

  }

    int idPersona;
    String nombre;
    String apellido;
    String sexo;
    String email;
    String birthday;

  crearBase() async{

    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentDirectory.path, 'Persona.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: ( Database db, int version) async{

        await db.execute(
          'CREATE TABLE Persona ('
          ' idPersona INTENGER PRIMARY KEY,'
          ' nombre TEXT,'
          ' apellido TEXT,'
          ' sexo TEXT,'
          ' email TEXT,'
          ' birthday TEXT'
          ');'
        );
      }
    );
  }


//CrearRegistro
  nuevoContacto( PersonaModel nuevapersona ) async{

    final db   = await database;
    final resp = await db.insert('Persona', nuevapersona.toJson());
    return resp;

  }

  Future<PersonaModel> getPersonaId( int id ) async{

    final db = await database;
    final resp = await db.query('Persona', where: 'id = ?', whereArgs: [id]);
    return resp.isNotEmpty ? PersonaModel.fromJson(resp.first) : null;

  }

  Future<List<PersonaModel>> getTodoPerson() async{

    final db   = await database;
    final resp = await db.query('Persona');
    List<PersonaModel> lista = resp.isNotEmpty ? 
        resp.map( (c) => PersonaModel.fromJson(c)).toList():[];
    return lista;

  }

  Future<List<PersonaModel>> getPersonaName( String name ) async{

    final db   = await database;
    final resp = await db.rawQuery("SELECT * FROM Persona WHERE nombre ='$name'");
    List<PersonaModel> lista = resp.isNotEmpty ? resp.map( (c) => PersonaModel.fromJson(c) ).toList() :[];
    return lista;

  }

  Future<int> updatePersona( PersonaModel cambioPers ) async{

    final db = await database;
    final resp = await db.update('Persona', cambioPers.toJson(), where: 'id = ?', whereArgs: [cambioPers.idPersona]);
    return resp;

  }

  Future<int> deletePersona( int id ) async{

    final db   = await database;
    final resp = await db.delete('Persona', where:'id = ?', whereArgs: [id]);
    return resp;

  }


}