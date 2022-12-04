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
      User user =
          User(id: data['id'], usuario: data['usuario'], clave: data['clave']);
      listaUsuarios.add(user);
    }
    return listaUsuarios;
  }
}
