import 'package:contactobloc/bloc/persona_bloc.dart';
import 'package:contactobloc/resource/db_provider.dart';
import 'package:flutter/material.dart';

class PersonaRegistro extends StatefulWidget {

  _PersonaRegistroState createState() => _PersonaRegistroState();
}

class _PersonaRegistroState extends State<PersonaRegistro> {

  final formKey        = GlobalKey<FormState>();
  final scaffoldKey    = GlobalKey<ScaffoldState>();
  PersonaModel persona = new PersonaModel();
  PersonaBloc personaBloc = new PersonaBloc();


  @override
  Widget build(BuildContext context) {

    //FIXME: vALIDAR LO DEL PROVIDER 
    final PersonaModel prodData = ModalRoute.of(context).settings.arguments; 

    if(prodData != null){
      persona = prodData;
    }

    return Scaffold(
      appBar: _crearTitulo(),
      body: SingleChildScrollView(
        child: formularios(context),
      ),
    );
  }



  Widget _crearTitulo(){

    return AppBar(
      centerTitle: true,
      title: Text('Crea Contactos'),
      backgroundColor: Color.fromRGBO(175, 31, 166, 1.0),
    );
  }

  Widget formularios(BuildContext context){

    return Container(

      padding: EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            _nombre(),
            Divider(),
            _apellido(),
            _boton()
          ],
        ),
      ),
    );
  }

  Widget _nombre(){

    return TextFormField(
      initialValue: persona.nombre,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder( borderRadius: BorderRadius.circular(15.0)),
        labelText: 'Nombre',
        hintText: 'Nombre Contacto',
        labelStyle: TextStyle( fontStyle: FontStyle.italic),
        icon: Icon(Icons.account_circle),
      ),
      validator: (value){
        if(value.length<2){
          return 'Ingrese un nombre';
        } else{
          return null;
        }
      },
      onSaved: (value) => persona.nombre = value,
    );

  }

  Widget _apellido(){

    return TextFormField(
      initialValue: persona.apellido,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder( borderRadius: BorderRadius.circular(15.0)),
        labelText: 'Apellido',
        hintText: 'Nombre Contacto',
        labelStyle: TextStyle( fontStyle: FontStyle.italic),
        icon: Icon(Icons.account_circle),
      ),
      validator: (value){
        if(value.length<2){
          return 'Ingrese un nombre';
        } else{
          return null;
        }
      },
      onSaved: (value) => persona.apellido = value,
    );

  }

  Widget _boton(){

    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
      ),
      color: Color.fromRGBO(194, 34, 194, 1.0),
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon( Icons.save),
      onPressed: () => _submin(),
    );
  }

  _submin(){

    if(!formKey.currentState.validate()) return;

    formKey.currentState.save();
    personaBloc.agregarContacto(persona);
    Navigator.pop(context);
    //_mostrarSnack('Registro Guardo');

  }

  void _mostrarSnack( String mensaje){

    final snackbar = SnackBar(
      backgroundColor: Colors.pink,
      content: Text('$mensaje'),
      duration: Duration( milliseconds: 1500),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
    _esperar();

  }

  Future _esperar(){
    return new Future.delayed(const Duration(milliseconds: 1800),()=> Navigator.pop(context));
  }


}
