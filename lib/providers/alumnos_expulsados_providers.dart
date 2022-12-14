import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:iseneca/models/alumnos_expulsados_response.dart';
import 'package:iseneca/models/users_responses.dart';

class AlumnosExpulsadosProvider extends ChangeNotifier {
  final List<AlumnosExpulsadosResponse> listaAlumnosExpulsados = [];

  AlumnosExpulsadosProvider() {
    getDataFromGoogleSheet();
  }

  Future<List<AlumnosExpulsadosResponse>> getDataFromGoogleSheet() async {
    var url =
        'https://script.google.com/macros/s/AKfycbzq6EP_1jV1RP7YO7dVMl0wRApuSWrQWWcOMdpbL6okGek_y3anbmIqQU48iOBz3h9m/exec?spreadsheetId=1Zr8D1_NCZl8z4895fRCNQFC5J6HnJuuFzLkTpKliJp0&sheet=Expulsados';
    Response data = await http.get(Uri.parse(url));

    dynamic jsonAppData = convert.jsonDecode(data.body);
    for (dynamic data in jsonAppData) {
      AlumnosExpulsadosResponse alumnosExpulsadosResponse =
          AlumnosExpulsadosResponse(
              alumno: data['alumno'],
              curso: data['curso'],
              fechaInicio: data['Fecha_Inicio'],
              fechaFin: data['Fecha_Fin']);
      listaAlumnosExpulsados.add(alumnosExpulsadosResponse);
    }
    return listaAlumnosExpulsados;
  }
}
