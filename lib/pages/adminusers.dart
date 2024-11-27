import 'package:flutter/material.dart';

class AdministrarUsuariosPage extends StatelessWidget {
  const AdministrarUsuariosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Barra de navegación
          Container(
            height: 80, // Altura del encabezado
            color: const Color.fromARGB(255, 135, 71, 15), // Color café
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15.0), // Espacio adicional arriba del ícono
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ), // Flecha para volver
                    iconSize: 40, // Tamaño del ícono de la flecha
                    onPressed: () {
                      Navigator.pop(context); // Volver a la pantalla anterior
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20), // Espacio para separar la barra
          // Imagen personalizada
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/img/empleados.png', // Ruta de la imagen personalizada
              height: 130,
              width: 130,
              fit: BoxFit.cover,
            ),
          ),
          // Espacio debajo de la imagen
          // Título de empleados
          const Text(
            'Empleados',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(96, 60, 30, 1),
            ),
          ),
          const SizedBox(height: 20), // Espacio debajo del título
          // Botón para agregar usuario
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Lógica para agregar un nuevo usuario
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Colors.black, width: 1),
                ),
              ),
              icon: const Icon(
                Icons.add, // Icono de agregar
                color: Colors.black,
              ),
              label: const Text(
                'Agregar Empleado',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 20), // Espacio debajo del botón
          // Tabla de empleados
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Nombre')),
                  DataColumn(label: Text('Teléfono')),
                  DataColumn(label: Text('Turno')),
                  DataColumn(label: Text('Usuario')),
                  DataColumn(label: Text('Acciones')),
                ],
                rows: [
                  DataRow(cells: [
                    const DataCell(Text('Juan Pérez')),
                    const DataCell(Text('555-1234')),
                    const DataCell(Text('Mañana')),
                    const DataCell(Text('jperez')),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Lógica para editar
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // Lógica para eliminar
                          },
                        ),
                      ],
                    )),
                  ]),
                  DataRow(cells: [
                    const DataCell(Text('Ana Gómez')),
                    const DataCell(Text('555-5678')),
                    const DataCell(Text('Tarde')),
                    const DataCell(Text('agomez')),
                    DataCell(Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Lógica para editar
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // Lógica para eliminar
                          },
                        ),
                      ],
                    )),
                  ]),
                  // Puedes agregar más filas aquí
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
