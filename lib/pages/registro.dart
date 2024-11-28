import 'package:flutter/material.dart';
import '../Services/usuario_service.dart'; // Importamos el servicio
import '../models/usuario_model.dart'; // Importamos el modelo
import './adminusers.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final _nombreController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _usuarioController = TextEditingController();
  final _contrasenaController = TextEditingController();

  bool _passwordVisible = false;
  String _turnoSeleccionado = "M";
  String _rolSeleccionado = "empleado";

  final UsuarioService usuarioService =
      UsuarioService(); // Instanciamos el servicio

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // Cabecera amarilla
              Container(
                height: 120,
                color: const Color.fromARGB(159, 251, 193, 45),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      iconSize: 30,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AdministrarUsuariosPage(), // Asegúrate de que LoginPage esté importado
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Formulario
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color.fromARGB(123, 0, 0, 0),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 74, 74, 74)
                                .withOpacity(0.4),
                            blurRadius: 10,
                            offset: const Offset(4, 4),
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Registro',
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'Aleo',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 109, 49, 12),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Campo Nombre
                          TextField(
                            controller: _nombreController,
                            decoration: InputDecoration(
                              labelText: 'Nombre',
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          // Campo Teléfono
                          TextField(
                            controller: _telefonoController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'Teléfono',
                              prefixIcon: const Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          // Campo Usuario
                          TextField(
                            controller: _usuarioController,
                            decoration: InputDecoration(
                              labelText: 'Usuario',
                              prefixIcon: const Icon(Icons.account_circle),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          // Campo Contraseña
                          TextField(
                            controller: _contrasenaController,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          // Lista Turno
                          DropdownButtonFormField<String>(
                            value: _turnoSeleccionado,
                            items: const [
                              DropdownMenuItem(
                                value: "M",
                                child: Text("Matutino"),
                              ),
                              DropdownMenuItem(
                                value: "V",
                                child: Text("Vespertino"),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _turnoSeleccionado = value!;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Turno',
                              prefixIcon: const Icon(Icons.access_time),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          // Lista Rol
                          DropdownButtonFormField<String>(
                            value: _rolSeleccionado,
                            items: const [
                              DropdownMenuItem(
                                value: "admin",
                                child: Text("Admin"),
                              ),
                              DropdownMenuItem(
                                value: "empleado",
                                child: Text("Empleado"),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _rolSeleccionado = value!;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Rol',
                              prefixIcon: const Icon(Icons.person_outline),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          // Botón Registrar
                          ElevatedButton(
                            onPressed: () async {
                              // Lógica para registrar
                              final nombre = _nombreController.text;
                              final telefono = _telefonoController.text;
                              final usuario = _usuarioController.text;
                              final contrasena = _contrasenaController.text;

                              if (nombre.isEmpty ||
                                  telefono.isEmpty ||
                                  usuario.isEmpty ||
                                  contrasena.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Por favor llena todos los campos'),
                                  ),
                                );
                              } else {
                                // Crear un nuevo usuario
                                final nuevoUsuario = Usuario(
                                  usuario: usuario,
                                  turno: _turnoSeleccionado,
                                  contrasena: contrasena,
                                  nombre: nombre,
                                  telefono: telefono,
                                  rol: _rolSeleccionado,
                                );
                                // Agregar el nuevo usuario al servicio
                                await usuarioService
                                    .agregarUsuario(nuevoUsuario);

                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Usuario $nombre registrado exitosamente'),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              side: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 70),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'Registrar',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
