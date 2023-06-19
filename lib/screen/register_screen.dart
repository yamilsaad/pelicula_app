//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    //Widget myButton = ButtonRegister.registerButton(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 0,
        ),
        child: Stack(alignment: AlignmentDirectional.topStart, children: [
          Column(
            children: [
              Stack(children: [
                Container(
                  //cuadro gris de fondo.
                  width: double.infinity,
                  height: 400,
                  color: Colors.indigo,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Center(
                    child: Icon(
                      Icons.flutter_dash_rounded,
                      color: Colors.grey.shade300,
                      size: 80,
                    ),
                  ),
                ),
              ]),
            ],
          ),
          Center(
            child: Container(
              width: 330,
              height: 475,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ]),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Container(
                    child: Text(
                      'Registrarse',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ChangeNotifierProvider(
                        create: (_) => LoginFormProvider(),
                        child: _FormWidget()),
                  ),
                  SizedBox(height: 10),
                  Container(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 2,
                    )),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) => loginForm.email = value,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.indigo,
                        ),
                        label: Text(
                          'Usuari@',
                          style: TextStyle(color: Colors.grey),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5.0)),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Por favor introducior nombre de usuario';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 2,
                    )),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) => loginForm.password = value,
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: ' ******',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.indigo,
                        ),
                        label: Text(
                          'Contraseña',
                          style: TextStyle(color: Colors.grey),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5.0)),

                    /*validator: (value) {
                  return (value != null && value.length >= 6)
                      ? null
                      : '¡La contraseña debe tener 6 caracteres!';
                },*/
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.indigo,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? 'Espere...' : 'Registrarse',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                //LoginForm llamado en este botón

                onPressed: loginForm.isLoading //loading sin conexión!
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        await Future.delayed(Duration(seconds: 2));
                        //TODO: VALIDAR SI LOGIN ES CORRECTO!!!
                        Navigator.pushNamed(context, 'home');
                      }

                /*onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();

                      if (!loginForm.isValidForm()) return;

                      loginForm.isLoading = true;

                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: loginForm.email,
                          password: loginForm.password,
                        );

                        // El usuario se ha registrado correctamente en Firebase

                        Navigator.pushNamed(context, 'home');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        } else {
                          print('Error creating user: ${e.code}');
                        }
                      } catch (e) {
                        print('Error creating user: $e');
                      }

                      loginForm.isLoading = false;
                    },*/
                ),
            SizedBox(height: 10),
            Container(
              height: 45,
              width: 220,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  hoverColor: Colors.black,
                  focusColor: Colors.black,
                  onTap: () {
                    print('ingreso con google');
                  },
                  child: Center(
                    child: Text(
                      'Ingresar con Google',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text(
                  '¿Ya tienes una cuenta?',
                  style: TextStyle(
                    color: Colors.indigo.shade300,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
