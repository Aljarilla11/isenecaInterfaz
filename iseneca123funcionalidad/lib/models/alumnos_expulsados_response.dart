// To parse this JSON data, do
//
//     final alumnosExpulsadosResponse = alumnosExpulsadosResponseFromMap(jsonString);

import 'dart:convert';

class AlumnosExpulsadosResponse {
  AlumnosExpulsadosResponse({
    required this.alumno,
    required this.curso,
    required this.fechaInicio,
    required this.fechaFin,
  });

  String alumno;
  String curso;
  String fechaInicio;
  String fechaFin;

  factory AlumnosExpulsadosResponse.fromJson(String str) =>
      AlumnosExpulsadosResponse.fromMap(json.decode(str));

  factory AlumnosExpulsadosResponse.fromMap(Map<String, dynamic> json) =>
      AlumnosExpulsadosResponse(
        alumno: json["Alumno"],
        curso: json["Curso"],
        fechaInicio: json["Fecha_Inicio"],
        fechaFin: json["Fecha_Fin"],
      );
}
