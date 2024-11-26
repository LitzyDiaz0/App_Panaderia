import 'package:flutter/material.dart';
import 'login.dart'; // Asegúrate de importar el archivo de LoginPage

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Retraso de 5 segundos para navegar a la página de login
    Future.delayed(const Duration(seconds: 4), () {
      // Redirige a la pantalla Login
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Parte superior:
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Bienvenido a la aplicación',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(117, 60, 9, 1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                        height:
                            30), // Reducir espacio entre el texto y la imagen
                    Image.asset(
                      'assets/img/logo.png',
                      width: 280,
                      height: 280,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Parte inferior: Amarillo más pequeño
          Expanded(
            flex: 2,
            child: Container(
              color: const Color.fromARGB(142, 242, 212, 113),
            ),
          ),
        ],
      ),
    );
  }
}
