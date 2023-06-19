//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../widgets/widget.dart';

//import '../components/button_register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    //Widget myButton = ButtonRegister.registerButton(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 0,
        ),
        child: Stack(alignment: AlignmentDirectional.topStart, children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Container(
                width: double.infinity,
                height: 1000,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    //el gradient es para el fondo de la pantalla.
                    colors: [Colors.black, Colors.blue.shade900],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    Column(
                      children: [
                        FlutterLogo(
                          size: 50,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextWidget(
                          text: 'Verifarma Video Club',
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Container(
                      child: Text(
                        'Bienvenid@',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 50),
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
          ),
        ]),
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  _FormWidget({
    super.key,
  });

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  bool _isObscure = true;
  // Estado para controlar la visibilidad de la contraseña
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
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) => loginForm.email = value,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
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
              height: 20,
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
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) => loginForm.password = value,
                      autocorrect: false,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        hintText: ' ******',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure =
                                  !_isObscure; // Cambia el estado para alternar la visibilidad
                            });
                          },
                        ),
                        label: Text(
                          'Contraseña',
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5.0),
                      ),
                    )),
              ),
            ),
            SizedBox(height: 50),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.grey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 115, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? 'Espere...' : 'Ingresar',
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
                        Navigator.pushReplacementNamed(context, 'home');
                      }

                /*onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: loginForm.email,
                            password: loginForm.password,
                          );

                          // El inicio de sesión fue exitoso, redirige a la página de inicio
                          Navigator.pushReplacementNamed(context, 'home');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            // No se encontró ningún usuario con ese correo electrónico
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            // La contraseña proporcionada es incorrecta
                            print('Wrong password provided for that user.');
                          } else {
                            // Otro error de Firebase Auth
                            print('Firebase Auth error: ${e.message}');
                          }
                        }

                        loginForm.isLoading = false;
                      }*/
                ),
            SizedBox(height: 10),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.red,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? 'Espere...' : 'Con Google',
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
                        Navigator.pushReplacementNamed(context, 'home');
                      }

                /*onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: loginForm.email,
                            password: loginForm.password,
                          );

                          // El inicio de sesión fue exitoso, redirige a la página de inicio
                          Navigator.pushReplacementNamed(context, 'home');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            // No se encontró ningún usuario con ese correo electrónico
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            // La contraseña proporcionada es incorrecta
                            print('Wrong password provided for that user.');
                          } else {
                            // Otro error de Firebase Auth
                            print('Firebase Auth error: ${e.message}');
                          }
                        }

                        loginForm.isLoading = false;
                      }*/
                ),
            Container(
              child: TextButton(
                onPressed: () {
                  //Navigator.pushReplacementNamed(context, 'register');
                },
                child: Text(
                  'Crear una cuenta',
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
