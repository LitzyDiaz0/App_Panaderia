import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import './registro.dart'; // Importa tu AuthService

class AdministrarUsuariosPage extends StatelessWidget {
  final AuthService authService = AuthService(); // Instancia de AuthService

  AdministrarUsuariosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Barra de navegación
          Container(
            height: 80,
            color: const Color.fromARGB(255, 135, 71, 15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    iconSize: 40,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Imagen personalizada
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipOval(
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/img/empleados.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Text(
            'Empleados',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(96, 60, 30, 1),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Lógica para agregar un nuevo usuario
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistroPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  icon: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    padding: const EdgeInsets.all(2.0),
                    child: const Icon(Icons.add, color: Colors.black),
                  ),
                  label: const Text(
                    'Agregar Empleado',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DataTable(
                      columnSpacing: 15,
                      // ignore: deprecated_member_use
                      dataRowHeight: 60,
                      columns: const [
                        DataColumn(label: Text('Nombre')),
                        DataColumn(label: Text('Teléfono')),
                        DataColumn(label: Text('Turno')),
                        DataColumn(label: Text('Usuario')),
                        DataColumn(label: Text('Acciones')),
                      ],
                      rows: authService.usuarios.map((user) {
                        return DataRow(
                          cells: [
                            DataCell(Text(user.nombre)),
                            DataCell(Text(user.telefono)),
                            DataCell(Text(user.turno)),
                            DataCell(Text(user.usuario)),
                            DataCell(Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  color: Colors.orange,
                                  onPressed: () {
                                    // Lógica para editar el usuario
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  color: Colors.pink,
                                  onPressed: () {
                                    // Lógica para eliminar el usuario
                                  },
                                ),
                              ],
                            )),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
