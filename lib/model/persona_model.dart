import 'dart:convert';

PersonaModel personaModelFromJson(String str) => PersonaModel.fromJson(json.decode(str));

String personaModelToJson(PersonaModel data) => json.encode(data.toJson());

class PersonaModel {
    int idPersona;
    String nombre;
    String apellido;
    String sexo;
    String email;
    String birthday;

    PersonaModel({
        this.idPersona,
        this.nombre     = '',
        this.apellido   = '',
        this.sexo       = '',
        this.email      = '',
        this.birthday   = '',
    });

    factory PersonaModel.fromJson(Map<String, dynamic> json) => new PersonaModel(
        idPersona : json["idPersona"],
        nombre    : json["nombre"],
        apellido  : json["apellido"],
        sexo      : json["sexo"],
        email     : json["email"],
        birthday  : json["birthday"],
    );

    Map<String, dynamic> toJson() => {
        //"idPersona" : idPersona,
        "nombre"    : nombre,
        "apellido"  : apellido,
        "sexo"      : sexo,
        "email"     : email,
        "birthday"  : birthday,
    };
}
