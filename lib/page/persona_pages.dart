import 'package:contactobloc/bloc/persona_bloc.dart';
import 'package:contactobloc/model/persona_model.dart';
import 'package:flutter/material.dart';

class PersonaPage extends StatelessWidget {
  
  final perbloc = new PersonaBloc();

  @override
  Widget build(BuildContext context) {

    perbloc.obtenerPersonas();

    return StreamBuilder<List<PersonaModel>>(
      stream: perbloc.personaStream ,
      
      builder: (BuildContext context, AsyncSnapshot<List<PersonaModel>> snapshot){

        if( !snapshot.hasData ){
          
          return Center( 
            child: CircularProgressIndicator(
              backgroundColor: Colors.pinkAccent,
              semanticsLabel: 'Cargando',
            ),
          );

        }

        final persona = snapshot.data;

        if(persona.length == 0){
          
          return Center(
            child: Text('No hay contactos', style: TextStyle( fontSize: 22.0),),
          );

        } else{

          return ListView.builder(
            itemCount: persona.length,
            itemBuilder: (context, i) => Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) => perbloc.borarPersona(persona[i].idPersona),
              child: ListTile(
                leading: Icon( Icons.person, color: Colors.pinkAccent,),
                title: Text( persona[i].nombre),
                subtitle: Text( persona[i].apellido),
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
                onTap: (){},
              ),
            ),
          );
        }


      },
    );
  }
}