import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/users_providers.dart';

class ContactosScreen extends StatelessWidget {
  final String? telefono;
  final String? mail;
  const ContactosScreen({Key? key, this.telefono, this.mail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: true);
    final userLogin = userProvider.listaUsuarios;

    final contacto = ['Gmail', 'Telefono'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profesores'),
        elevation: 0,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.separated(
        itemCount: contacto.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(contacto[index]),
          trailing: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Color.fromARGB(255, 69, 171, 255),
          ),
          onTap: () async {
            if (index == 0) {
              Uri url = Uri.parse(
                  'mailto:$mail?subject=Greetings&body=Hello%20World');
              await launchUrl(url);
            }
            if (index == 1) {
              // ignore: deprecated_member_use
              await launch('tel://' + telefono!);
            }
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
