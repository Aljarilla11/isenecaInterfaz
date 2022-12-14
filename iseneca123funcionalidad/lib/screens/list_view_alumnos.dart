import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListViewAlumnosScreen extends StatelessWidget {
  const ListViewAlumnosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alumnos = ['Alumnos Expulsados', 'Alumnos en Convivencia'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Alumnos'),
        elevation: 0,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.separated(
        itemCount: alumnos.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(alumnos[index]),
          trailing: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Color.fromARGB(255, 69, 171, 255),
          ),
          onTap: () async {
            if (index == 0) {
              const url =
                  'https://docs.google.com/spreadsheets/d/1Zr8D1_NCZl8z4895fRCNQFC5J6HnJuuFzLkTpKliJp0/edit#gid=0';
              // ignore: deprecated_member_use
              launch(url);
            } else {
              const url =
                  'https://docs.google.com/spreadsheets/d/1lbcx5Ya4RGNxG2tZY8COrUEX4AzKek_jrBaeUSPv9cE/edit#gid=0';
              // ignore: deprecated_member_use
              await launch(url);
            }
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
