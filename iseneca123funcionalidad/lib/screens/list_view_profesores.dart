import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:iseneca/screens/contactos_screen.dart';
import 'package:provider/provider.dart';

import '../providers/users_providers.dart';

class ListViewProfesoresScreen extends StatelessWidget {
  const ListViewProfesoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: true);
    final userLogin = userProvider.listaUsuarios;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profesores'),
        elevation: 0,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.separated(
        itemCount: userLogin.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(userLogin[index].usuario),
          trailing: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Color.fromARGB(255, 69, 171, 255),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContactosScreen(
                        telefono: userLogin[index].telefono,
                        mail: userLogin[index].mail,
                      )),
            );
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
