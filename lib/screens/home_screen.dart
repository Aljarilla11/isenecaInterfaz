import 'package:flutter/material.dart';
import 'package:iseneca/providers/users_providers.dart';
import 'package:iseneca/screens/second_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_imput_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'first_name': 'Alejandro',
      'password': '12345',
    };
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        body: Center(
          child: login1Screen(myFormKey, formValues, context),
        ),
      ),
    );
  }

  SingleChildScrollView login1Screen(GlobalKey<FormState> myFormKey,
      Map<String, String> formValues, BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: true);
    final userLogin = userProvider.listaUsuarios;

    void checkLoginUsers(BuildContext context) {
      userLogin.forEach((user) {
        if (user.usuario == formValues['first_name'] &&
            user.clave == formValues['password']) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SecondScreen(
                    first_name: formValues['first_name'],
                    password: formValues['password'])),
          );
        }
      });
    }

    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: myFormKey,
              child: Column(
                children: [
                  const Image(
                    image: NetworkImage(
                        'https://media.discordapp.net/attachments/922814405882818570/1037708121142988800/iseneca.png'),
                    width: double.infinity,
                    height: 150,
                  ),
                  CustomImputField(
                    labelText: 'Usuario',
                    hintText: 'Usuario',
                    formProperty: 'first_name',
                    formValues: formValues,
                  ),
                  const SizedBox(height: 30),
                  CustomImputField(
                    labelText: 'Contraseña',
                    hintText: 'Contraseña',
                    obscureText: true,
                    formProperty: 'password',
                    formValues: formValues,
                    suffixIcon: Icons.remove_red_eye,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      //FocusScope.of(context).requestFocus(FocusNode());
                      userLogin.forEach((user) {
                        print(user.usuario);
                        print(user.clave);
                        if (user.usuario == formValues['first_name'] &&
                            user.clave == formValues['password']) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondScreen(
                                    first_name: formValues['first_name'],
                                    password: formValues['password'])),
                          );
                        }
                      });
                      print(formValues);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Background color
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      height: 75,
                      child: Center(
                        child: Text(
                          "Entrar",
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text('No recuerdo mi contraseña',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  const Text('___________________________',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                  const SizedBox(
                    height: 100,
                  ),
                  const Image(
                    image: NetworkImage(
                        'https://www.juntadeandalucia.es/economiaconocimientoempresasyuniversidad/fondoseuropeosenandalucia/storage/imagencorporativa/49787641cd5d3c0dfc921ea468509c8f.png'),
                    height: 60,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'v11.3.0',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
