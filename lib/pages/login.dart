import 'package:flutter/material.dart';
import './admnprinc.dart';
import './puntoventa.dart'; // Pantalla para empleados
import '../services/auth_service.dart'; // Servicio de autenticación

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final AuthService authService =
      AuthService(); // Instancia del servicio de autenticación
  bool _obscurePassword = true; // Para ocultar/mostrar la contraseña

  void _login() {
    String usuario = usuarioController.text.trim();
    String contrasena = contrasenaController.text.trim();

    if (usuario.isEmpty || contrasena.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingrese usuario y contraseña')),
      );
      return;
    }

    // Validar login usando el servicio
    final user = authService.validarLogin(usuario, contrasena);

    if (user != null) {
      // Si el usuario existe, redirige según el rol
      if (user.rol == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AdminPage(),
          ),
        );
      } else if (user.rol == 'empleado') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PuntoDeVentaPage(rol: user.rol),
          ),
        );
      }
    } else {
      // Si el login falla, muestra un mensaje
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario o contraseña incorrectos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo con imagen
          Positioned.fill(
            child: Image.asset(
              'assets/img/fondo.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Contenedor blanco en la parte superior
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: const Text(
                'El Rincón del pan',
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: 'Italianno',
                  color: Color.fromRGBO(144, 73, 10, 1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Caja de login con fondo blanco
          Positioned(
            top: 250,
            left: 25,
            right: 25,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: const Border(
                  top: BorderSide(
                      color: Color.fromRGBO(144, 73, 10, 1), width: 10),
                  left: BorderSide(
                      color: Color.fromRGBO(144, 73, 10, 1), width: 10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Aleo',
                        color: Color.fromRGBO(107, 58, 19, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: usuarioController,
                      decoration: const InputDecoration(
                        labelText: 'Usuario:',
                        labelStyle: TextStyle(fontFamily: 'Amethysta'),
                      ),
                    ),
                    const SizedBox(height: 35),
                    TextField(
                      controller: contrasenaController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Contraseña:',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed:
                          _login, // Conecta el botón con el método _login
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        textStyle: const TextStyle(fontSize: 18),
                        backgroundColor: const Color.fromARGB(
                            255, 255, 255, 255), // Fondo blanco del botón
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: const Text(
                        'Aceptar',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
