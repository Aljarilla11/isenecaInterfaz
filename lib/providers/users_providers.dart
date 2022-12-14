import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:iseneca/models/users_responses.dart';

class UserProvider extends ChangeNotifier {
  final List<User> listaUsuarios = [];

  UserProvider() {
    getDataFromGoogleSheet();
  }

  Future<List<User>> getDataFromGoogleSheet() async {
    var url =
        'https://script.google.com/macros/s/AKfycbzq6EP_1jV1RP7YO7dVMl0wRApuSWrQWWcOMdpbL6okGek_y3anbmIqQU48iOBz3h9m/exec?spreadsheetId=1SPFk04l6FtyrZlWDTGGSsMZhXuLTrPrGUuLB3BUCvcs&sheet=usuarios';
    Response data = await http.get(Uri.parse(url));

    dynamic jsonAppData = convert.jsonDecode(data.body);
    for (dynamic data in jsonAppData) {
      User user = User(
          id: data['id'],
          usuario: data['usuario'],
          clave: data['clave'],
          telefono: data['telefono'],
          mail: data['mail']);
      listaUsuarios.add(user);
    }
    return listaUsuarios;
  }
}


/**
 * import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:i_seneca/models/convivencia_response.dart';
import 'package:i_seneca/models/data_response.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:i_seneca/models/expulsados_response.dart';

class ProveedorDatos extends ChangeNotifier {

  List<User> onUsers = [];
  List<Convivencia> onConvivencia = [];
  List<Expulsados> onExpulsados = [];

  ProveedorDatos() {
    _getDataFromGoogleSheet();
    _getDataConvivencia();
    _getDataExpulsados();
  }

  Future<List<User>> _getDataFromGoogleSheet() async {
    var url =
        'https://script.google.com/macros/s/AKfycbzq6EP_1jV1RP7YO7dVMl0wRApuSWrQWWcOMdpbL6okGek_y3anbmIqQU48iOBz3h9m/exec?spreadsheetId=1SPFk04l6FtyrZlWDTGGSsMZhXuLTrPrGUuLB3BUCvcs&sheet=usuarios';
    
    Response data = await http.get(Uri.parse(url));

    dynamic jsonAppData = convert.jsonDecode(data.body);

    for (dynamic data in jsonAppData) {
      User user = User(
        id: data['id'], 
        usuario: data['usuario'], 
        clave: data['clave'], 
        telefono: data['telefono'],
        mail: data['mail']
      );
      onUsers.add(user);
    }

    return onUsers;

  }

  Future<List<Convivencia>> _getDataConvivencia() async {
    var url =
        'https://script.googleusercontent.com/macros/echo?user_content_key=2RHTLapyHmIk7Cvs55t92DBnVQrV0dlnsuN33PRzGh9kLnWQasJzM-vaOWpFSsrbw-MEqgyBTGZxguvUrdw0jAnz6qU52aRqOJmA1Yb3SEsKFZqtv3DaNYcMrmhZHmUMWojr9NvTBuBLhyHCd5hHa2zN8CwFcRmMxuQlb9QAK6XyfGylfXoJZsHZ-sHKWVNx9ki0W0t8BqMhdGPZF8o_4tD7gCWpVeYkZFEtUCy76pfIXgM0vUAjuwphNhsYRp8Vl2M2SIw1mG_V1GzHUEiZXRJVwYm7O_UgK3aRMCcOEDLg5emIy6cQ3dcZj7SKdiA285uYdG6RT8msq2bIYhvH2Y-O25k7dvZH&lib=MmZsrU7OnOsBEFi8CQfmp8vROsxUrixEc';
    
    Response data = await http.get(Uri.parse(url));

    dynamic jsonAppData = convert.jsonDecode(data.body);

    for (dynamic data in jsonAppData) {
      Convivencia convivencia = Convivencia(
        alumno: data["Alumno"],
        curso: data["Curso"],
        fechaInicio: data["Fecha_Inicio"],
        fechaFin: data["Fecha_Fin"],
      );
      onConvivencia.add(convivencia);
    }

    return onConvivencia;

  }

  Future<List<Expulsados>> _getDataExpulsados() async {
    var url =
        'https://script.googleusercontent.com/macros/echo?user_content_key=4op7tPSSs2bz7rwzqsBFMEVQ7Pd7h9QWkFu_MCcwBBz-cnLPIYDQGAk21a1xZE6qHuWSDoAHmbbYR7dvw_-THbFi_3Mu1qiSOJmA1Yb3SEsKFZqtv3DaNYcMrmhZHmUMWojr9NvTBuBLhyHCd5hHa2zN8CwFcRmMxuQlb9QAK6XyfGylfXoJZsHZ-sHKWVNx9ki0W0t8BqMhdGPZF8o_4tD7gCWpVeYkZFEtUCy76pfIXgM0vUAjuwphNhsYRp8Vl2M2SIw1mG9NrX_cHHZwJQmagLt52TnafJEohR4jnqun5V6EJLKVVkKwuiGKar1l7y7OI088h1JU5R8lpP6Vd9_zitJNgPs0&lib=MmZsrU7OnOsBEFi8CQfmp8vROsxUrixEc';
    
    Response data = await http.get(Uri.parse(url));

    dynamic jsonAppData = convert.jsonDecode(data.body);

    for (dynamic data in jsonAppData) {
      Expulsados expulsados = Expulsados(
        alumno: data["Alumno"],
        curso: data["Curso"],
        fechaInicio: data["Fecha_Inicio"],
        fechaFin: data["Fecha_Fin"],
      );
      onExpulsados.add(expulsados);
    }

    return onExpulsados;

  }

}
 */