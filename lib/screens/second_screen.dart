import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iseneca/providers/users_providers.dart';
import 'package:iseneca/screens/home_screen.dart';
import 'package:iseneca/screens/list_view_alumnos.dart';
import 'package:iseneca/screens/list_view_profesores.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  final String? first_name;
  final String? password;
  const SecondScreen({Key? key, this.first_name, this.password})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.blue.shade900,
              child: const Image(
                image: NetworkImage(
                    'https://media.discordapp.net/attachments/922814405882818570/1037708121142988800/iseneca.png'),
                width: double.infinity,
                height: 180,
                color: Colors.white,
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              margin: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '$first_name',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 270,
                        ),
                        const Icon(Icons.people),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'C.E.I.P. Maestros Eduardo Lobillo',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Perfil Profesorado',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.blue,
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Icon(
                            Icons.access_alarm_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Avisos',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          VerticalDivider(
                            thickness: 0.5,
                            width: 20,
                            color: Colors.white,
                          ),
                          IconButton(
                              icon: Icon(Icons.book_outlined),
                              color: Colors.white,
                              onPressed: () {
                                Widget okButton = TextButton(
                                  child: Text("OK"),
                                  onPressed: (() => Navigator.pop(context)),
                                );

                                // set up the AlertDialog
                                AlertDialog alert = AlertDialog(
                                  title: Text("Bandeja de Firma"),
                                  content: Text(
                                      "Oops. Hay un error, lo areglaremos cuanto antes"),
                                  actions: [
                                    okButton,
                                  ],
                                );

                                // show the dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Bandeja de firmas',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    IconButton(
                        icon: Image.asset('assets/sombrero.png'),
                        iconSize: 60,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ListViewAlumnosScreen()),
                          );
                        }),
                    const Text(
                      'Alumnado del',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    const Text(
                      'centro',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    IconButton(
                        icon: Image.asset('assets/profesor.png'),
                        iconSize: 60,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ListViewProfesoresScreen()),
                          );
                        }),
                    const Text(
                      'Personal del',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    const Text(
                      'centro',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: const [
                    Image(
                      image: AssetImage('assets/covid.png'),
                      width: 60,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Informacion',
                      style: TextStyle(fontSize: 21, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      'Covid',
                      style: TextStyle(fontSize: 21, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 65,
                ),
                Column(
                  children: const [
                    SizedBox(
                      width: 100,
                    ),
                    Image(
                      image: AssetImage('assets/calendario.png'),
                      width: 60,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Calendario',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      'escolar',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 65,
                ),
                Column(
                  children: const [
                    Image(
                      image: AssetImage('assets/campana.png'),
                      width: 60,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Tablon de',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      'anuncios',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 0, 30, 54),
                  size: 45,
                ),
                label: 'Inicio'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.history_rounded,
                  color: Color.fromARGB(255, 136, 136, 136),
                  size: 45,
                ),
                label: 'Agenda'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat_bubble_outline,
                  color: Color.fromARGB(255, 136, 136, 136),
                  size: 45,
                ),
                label: 'Comunicaciones'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                color: Color.fromARGB(255, 136, 136, 136),
                size: 45,
              ),
              label: 'Menu',
            ),
          ],
        ),
      ),
    );
  }
}
